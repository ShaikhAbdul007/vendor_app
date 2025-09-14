import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/colors.dart';
import '../../../helper/constant.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      //  backgroundColor: AppColors.gradientStartColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft, // Start point
            end: Alignment.centerRight, // End point
            colors: [
              Color(0xFF64E3DD), // Teal/Aqua color on the left
              Color(0xFFF9A268), // Orange color on the right
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash_logo.png',
            ),
            Constant.customCircularProgressIndicator(
                color: AppColors.blackColor),
          ],
        ),
      ),
    );
  }
}
