import 'package:flutter/material.dart';
import 'package:vendor_app/helper/colors.dart';
import 'package:vendor_app/helper/sizebox.dart';

class CustomToggleButton extends StatelessWidget {
  final bool isToggleEnable;
  final void Function(bool)? onChanged;
  final String label;
  final double width;

  const CustomToggleButton({
    super.key,
    this.isToggleEnable = false,
    this.onChanged,
    required this.label,
    this.width = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(isToggleEnable ? '$label Enable' : '$label Disable'),
        setWidth(width: width),
        Switch(
          value: isToggleEnable,
          onChanged: onChanged,
          activeTrackColor: AppColors.blackColor,
          activeColor: AppColors.primaryColorEnd,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}
