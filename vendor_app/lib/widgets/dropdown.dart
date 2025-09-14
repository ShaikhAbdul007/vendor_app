import 'package:flutter/material.dart';

import '../helper/colors.dart';

class CustomDropDown extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic selectedDropDownItem;
  final String label;
  final String helpText;
  final Function(dynamic value) notifyParent;
  const CustomDropDown(
      {super.key,
      required this.listItems,
      required this.notifyParent,
      this.selectedDropDownItem,
      required this.label,
      required this.helpText});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<dynamic>(
        hint: Text(
          helpText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        decoration: InputDecoration(
          label: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 14, color: AppColors.primaryColor),
          ),
          helperStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 10, color: AppColors.primaryColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.2,
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 10, right: 5, top: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.2,
            ),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: ((value) => value == null ? helpText : null),
        isExpanded: true,
        isDense: true,
        value: selectedDropDownItem,
        items: listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
          return DropdownMenuItem<dynamic>(
            value: item,
            child: Text(
              item,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 12, color: AppColors.primaryColor),
            ),
          );
        }).toList(),
        onChanged: (value) {
          notifyParent(value);
        },
      ),
    );
  }
}
