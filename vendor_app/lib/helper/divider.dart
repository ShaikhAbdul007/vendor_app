import 'package:flutter/material.dart';
import 'colors.dart';

Widget customDivider({
  bool isParameterGiven = false,
  Color? color,
  double? indent,
  double? endIndent,
}) {
  return Divider(
    color: isParameterGiven ? color : AppColors.greyColor,
    thickness: 1.5,
    height: 0,
    indent: isParameterGiven ? indent : 20,
    endIndent: isParameterGiven ? endIndent : 20,
  );
}
