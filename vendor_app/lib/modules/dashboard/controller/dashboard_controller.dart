import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';
import 'package:vendor_app/network/repository.dart';

import '../../../helper/constant.dart';

class DashboardController extends GetxController with CacheManager {
  final repo = Repository();
  RxString mobileNumber = RxString('');
  RxBool isLoading = RxBool(false);

  postBrandingData(
      {required BuildContext context, required String phoneNumber}) async {
    bool imageEnabled = await retriveImageToggleValue();
    bool videoEnabled = await retriveVideoToggleValue();
    bool textEnabled = await retriveTextToggleValue();
    bool locationEnabled = await retriveLocationToggleValue();
    Map body = {
      "mobile": phoneNumber,
      "imageEnabled": imageEnabled,
      "videoEnabled": videoEnabled,
      "textEnabled": textEnabled,
      "locationEnabled": locationEnabled
    };
    Constant.printLog('sending body is $body');
    try {
      var response = await repo.postSendBrandingData(body);
      Constant.printLog('Branding response is ${response.message}');
    } catch (e) {
      return throw (e);
    }
  }
}
