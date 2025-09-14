import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helper/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxInputLength;
  final bool filteringTextInputFormatterRequired;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
      this.maxLines = 1,
      this.validator,
      this.suffixIcon,
      this.readOnly = false,
      this.keyboardType,
      this.minLines = 1,
      this.maxInputLength = 500,
      this.filteringTextInputFormatterRequired = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontSize: 13, color: AppColors.blackColor),
        keyboardType: keyboardType,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxInputLength),
          filteringTextInputFormatterRequired
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        obscureText: obscureText,
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        validator: validator,
        readOnly: readOnly,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          hintText: hintText,
          labelText: hintText,
          labelStyle:
              Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.2,
              )),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.2,
            ),
          ),
        ));
  }
}
