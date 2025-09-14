import 'package:get/get.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';
import 'package:vendor_app/helper/error.dart';
import 'package:vendor_app/network/repository.dart';
import '../../../helper/constant.dart';
import '../../../helper/image_video_picker.dart';

class ImageScreenController extends GetxController with CacheManager {
  final repo = Repository();
  RxString imagePath = RxString('');
  RxBool isLoading = RxBool(false);
  RxBool light = RxBool(false);
  ImageVideoPicker imageAndVideoPicker = ImageVideoPicker();

  sendImage(String imagePath) async {
    String? token = retriveToken();

    var result =
        await repo.sendImageAndVideo(imagePath, isLoading, token, 'image');

    if (result == true) {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: 'Image Uploaded Successfully',
          isSuccess: true);
    } else {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: somethingWentWrongError,
          isSuccess: false);
    }
  }
}
