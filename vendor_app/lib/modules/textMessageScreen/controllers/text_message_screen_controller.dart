import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../cache manager/cache_manager.dart';
import '../../../helper/constant.dart';
import '../../../helper/error.dart';
import '../../../network/repository.dart';

class TextMessageScreenController extends GetxController with CacheManager {
  final repo = Repository();
  RxBool isLoading = RxBool(false);
  RxBool light = RxBool(false);

  TextEditingController messageController = TextEditingController(
      text:
          'Hi  \nThankyou for contacting for us. Our agent will contact you soon with more info');

  sendText() async {
    String? token = retriveToken();

    var result =
        await repo.sendText(isLoading, token, 'text', messageController.text);

    if (result == true) {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: 'Text Uploaded Successfully',
          isSuccess: true);
    } else {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: somethingWentWrongError,
          isSuccess: false);
    }
  }
}
