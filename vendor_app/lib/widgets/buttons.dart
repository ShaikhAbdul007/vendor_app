import 'package:flutter/material.dart';
import 'package:vendor_app/helper/colors.dart';

import '../helper/constant.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double? lottieHeight;
  final double width;
  final String label;
  final bool isLoading;
  final bool isOperationPerform;
  final bool isLottieHeight;
  final void Function() onPress;

  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      this.isLoading = false,
      this.lottieHeight,
      this.isLottieHeight = false,
      required this.label,
      required this.onPress,
      this.isOperationPerform = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPress,
      child: isLoading
          ? Constant.customCircularProgressIndicator(
              fontSize: 30, color: AppColors.gradientEndColor)
          : Container(
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(offset: Offset(5, 5))],
                  gradient: AppColors.primaryGradient1,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5)),
              width: width,
              height: height,
              child: Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              )),
    );
  }
}
