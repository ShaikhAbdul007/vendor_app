import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Helper/colors.dart';

class CustomTheme {
  CustomTheme._();
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      hoverColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      textTheme: GoogleFonts.latoTextTheme(),
      splashFactory: NoSplash.splashFactory,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.gradientStartColor,
          iconTheme: IconThemeData(color: AppColors.blackColor)),
      iconTheme: const IconThemeData(color: AppColors.blackColor),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      hoverColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      textTheme: GoogleFonts.latoTextTheme(),
      splashFactory: NoSplash.splashFactory,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whiteColor,
          iconTheme: IconThemeData(color: AppColors.whiteColor)),
      iconTheme: const IconThemeData(color: AppColors.whiteColor),
    );
  }
}
