import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vendor_app/helper/colors.dart';

class Constant {
  static getSnackBar(
      {required String errorType,
      required String errorMessage,
      required bool isSuccess,
      Icon? iconChanged,
      bool isErrorIconChangeRequired = false,
      bool isInfo = false}) {
    Get.rawSnackbar(
        borderColor: isInfo
            ? Colors.black87
            : isSuccess
                ? Colors.green.shade600
                : Colors.red.shade600,
        borderWidth: 1,
        borderRadius: 15,
        messageText: Text(
          errorMessage,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        animationDuration: const Duration(seconds: 1),
        snackStyle: SnackStyle.FLOATING,
        icon: isInfo
            ? const Icon(Icons.info_outline, color: Colors.black)
            : isSuccess
                ? Icon(Icons.done, size: 25, color: Colors.green.shade600)
                : isErrorIconChangeRequired
                    ? iconChanged
                    : Icon(Icons.error_outline,
                        size: 25, color: Colors.red.shade600),
        backgroundColor: isInfo
            ? Colors.grey.shade50
            : isSuccess
                ? Colors.green.shade50
                : Colors.red.shade50,
        snackPosition: SnackPosition.TOP);
  }


  static Widget customCircularProgressIndicator(
      {double fontSize = 50, Color color = Colors.black}) {
    return SpinKitFadingCircle(
      color: color,
      size: fontSize,
    );
  }

  static customShowDialog(BuildContext context, Widget? content,
      [bool barrierDismissible = false]) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            content: content!);
      },
    );
  }

  static showGetDialogue(
      {required TextStyle textStyle,
      required String titleText,
      required Widget content,
      bool barrierDismissible = false}) {}

  static void printLog(logMessage) {
    if (kDebugMode) {
      print(logMessage);
    }
  }
}
