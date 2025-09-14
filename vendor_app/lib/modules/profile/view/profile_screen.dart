import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/modules/profile/controller/user_profile_controller.dart';
import 'package:vendor_app/widgets/buttons.dart';
import 'package:vendor_app/widgets/textfield.dart';

import '../../../helper/common_appbar.dart';
import '../../../helper/sizebox.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserProfilController controller = Get.put(UserProfilController());
    return CommonAppbar(
        title: 'Profile',
        body: Padding(
            padding: EdgeInsets.only(left: 5, right: 10, bottom: 10),
            child: ListView(
              children: [
                setHeight(height: 10),
                Center(
                  child: CircleAvatar(
                    radius: 55,
                    child: const Image(
                      image: AssetImage('assets/vendor.png'),
                      height: 50,
                    ),
                  ),
                ),
                setHeight(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: ProfileItem(
                        controller: controller.name,
                        hintText: 'Name',
                      ),
                    ),
                    setWidth(width: 10),
                    Expanded(
                      child: ProfileItem(
                        controller: controller.mobileNumber,
                        hintText: 'Mobile Number',
                      ),
                    ),
                  ],
                ),
                setHeight(height: 10),
                ProfileItem(
                  controller: controller.address,
                  hintText: 'Address',
                ),
                setHeight(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ProfileItem(
                        controller: controller.shopname,
                        hintText: 'Shop Name',
                      ),
                    ),
                    setWidth(width: 10),
                    Expanded(
                      child: ProfileItem(
                        controller: controller.package,
                        hintText: 'Package',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 40),
                  child: CustomButton(
                      height: 40, width: 50, label: 'Save', onPress: () {
                        
                      }),
                )
              ],
            )));
  }
}

class ProfileItem extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const ProfileItem(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(hintText: hintText, controller: controller);
  }
}
