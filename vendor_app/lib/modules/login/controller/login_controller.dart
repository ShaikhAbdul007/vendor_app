import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';
import 'package:vendor_app/network/repository.dart';
import 'package:vendor_app/routes/routes.dart';
import '../../../helper/constant.dart';
import '../../../helper/error.dart';
import '../../../helper/location.dart';
import '../model/login_model.dart';

class LoginController extends GetxController with CacheManager {
  final repo = Repository();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = false.obs;
  RxBool isLoading = false.obs;
  Location locations = Location();

  @override
  void onInit() async {
    await locations.checkAndRequestPermission();
    super.onInit();
  }

  togglePassword() {
    passwordVisible.value = !passwordVisible.value;
  }

  postLoginData({
    required BuildContext context,
  }) async {
    isLoading.value = true;
    Map body = {
      "mobile": mobileNumber.text,
      "password": passwordController.text
    };
    try {
      var response = await repo.postLoginData(body);
      checkResponse(
        loginResponseModel: response,
        context: context,
      );
    } catch (e) {
      isLoading.value = false;
      return throw (e);
    }
  }

  void checkResponse({
    required LoginResponseModel loginResponseModel,
    required BuildContext context,
  }) {
    if (loginResponseModel.status == success) {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: loginResponseModel.message ?? '',
          isSuccess: true);
      saveToken(loginResponseModel.token ?? '');
      print(loginResponseModel.token ?? '');
      saveUserLoggedIn(true);
      Future.delayed(Duration(seconds: 2), () {
        MyRoutes.navigateToRoute(routeName: MyRoutes.bottomNavigationScreen);
      });

      isLoading.value = false;
    } else if (loginResponseModel.status == failed) {
      isLoading.value = false;
      Constant.getSnackBar(
          errorType: failed,
          errorMessage: loginResponseModel.message ?? 'No Failed message',
          isSuccess: false);
    }
  }
}
