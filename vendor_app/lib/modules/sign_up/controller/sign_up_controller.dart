import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';
import 'package:vendor_app/helper/error.dart';
import 'package:vendor_app/modules/profile/model/user_profile_response.dart';
import 'package:vendor_app/modules/sign_up/model/signup_model.dart';
import 'package:vendor_app/network/repository.dart';

import '../../../helper/constant.dart';
import '../view/payment_qr_code.dart';

class SignUpController extends GetxController with CacheManager {
  final repo = Repository();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController shopname = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedDropDrownValue = '';
  RxBool passwordVisible = false.obs;
  RxBool isLoading = false.obs;
  List<String> packageList = ['Basic', 'Silver', 'Platinum'];

  toggle() {
    passwordVisible.value = !passwordVisible.value;
  }

  postSignUpData(
      {required BuildContext context,
      required UPIDetails upiDetailsWithoutAmount,
      required void Function() onButtonOnPress}) async {
    isLoading.value = true;
    Map body = {
      "fullName": name.text,
      "mobile": mobileNumber.text,
      "shopName": shopname.text,
      "email": email.text,
      "address": address.text,
      "package": selectedDropDrownValue,
      "password": passwordController.text
    };

    try {
      var response = await repo.postSignUpData(body);
      checkResponse(
          signUpModel: response,
          context: context,
          upiDetailsWithoutAmount: upiDetailsWithoutAmount,
          onButtonOnPress: onButtonOnPress);
    } catch (e) {
      isLoading.value = false;
      return throw (e);
    }
  }

  void checkResponse(
      {required SignUpModel signUpModel,
      required BuildContext context,
      required UPIDetails upiDetailsWithoutAmount,
      required void Function() onButtonOnPress}) {
    if (signUpModel.status == success) {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: signUpModel.message ?? '',
          isSuccess: true);
      saveUserDetails(UserProfileResponse(
        name: name.text,
        mobile: mobileNumber.text,
        shopName: shopname.text,
        email: email.text,
        address: address.text,
        package: selectedDropDrownValue,
      ));

      PaymentQrCode.createQrCode(
          context: context,
          upiDetailsWithoutAmount: upiDetailsWithoutAmount,
          onButtonOnPress: onButtonOnPress);
      isLoading.value = false;
    } else if (signUpModel.status == failed) {
      isLoading.value = false;
      if (signUpModel.message ==
          "pq: duplicate key value violates unique constraint \"users_mobile_key\"") {
        Constant.getSnackBar(
            errorType: failed,
            errorMessage:
                'Already Register please try with new mobile no and email id',
            isSuccess: false);
      } else {
        Constant.getSnackBar(
            errorType: failed,
            errorMessage: signUpModel.message ?? 'no message',
            isSuccess: false);
      }
    }
  }
}
