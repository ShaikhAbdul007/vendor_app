import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';

class UserProfilController extends GetxController with CacheManager {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController shopname = TextEditingController();
  TextEditingController package = TextEditingController();

  @override
  void onInit() async {
    setData();
    super.onInit();
  }

  setData() {
    var userData = retriveUserDetails();
    mobileNumber.text = userData.mobile ?? '';
    name.text = userData.name ?? '';
    address.text = userData.address ?? '';
    email.text = userData.email ?? '';
    shopname.text = userData.shopName ?? '';
    package.text = userData.package ?? '';
  }
}
