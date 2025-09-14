import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color bottomSheetColor = Colors.white;
  static const Color primaryColorStart = Color(0xFF6234D1); // Purple shade
  static const Color primaryColorEnd = Color(0xFFF48B56); // Orange shade
  static const Color scannerColor = Color(0xFF216eb4);
  static const Color buttonTextColor = Color(0xFFF5F5F5);
  static const Color iconColor = Color(0xFF5f6267);
  static const Color subTextColor = Color(0xFF504F4F);
  static const Color successColor = Color(0xFF90EE90);
  static const Color blackColor = Colors.black;
  static const Color primaryColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color redColor = Colors.red;
  static const Color greenColor = Colors.green;
  static const Color errorOutline = Color(0xFFFF0000);
  static const Color transparent = Colors.transparent;

  static const Color gradientStartColor =
      Color(0xFFFBAB66); // Approximate orange color
  static const Color gradientEndColor =
      Color(0xFF56CCF2); // Approximate light blue color

  // Define the primary gradient
  static const LinearGradient primaryGradient1 = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      gradientEndColor,
      gradientStartColor,
    ],
  );

  // Define the primary gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColorStart,
      primaryColorEnd,
    ],
  );
}
