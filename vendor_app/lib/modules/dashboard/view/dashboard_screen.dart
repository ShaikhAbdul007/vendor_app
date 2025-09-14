import 'package:flutter/material.dart';
import 'package:phone_state/phone_state.dart';
import 'package:vendor_app/routes/routes.dart';
import 'package:get/get.dart';
import '../../../helper/common_appbar.dart';
import '../../../helper/constant.dart';
import '../../../widgets/buttons.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    return CommonAppbar(
      isDrawerRequired: true,
      title: 'DashBoard',
      actionChild: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: IconButton(
          onPressed: () {
            MyRoutes.navigateToRoute(routeName: MyRoutes.notificationScreen);
          },
          icon: const Icon(
            Icons.notifications,
          ),
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder(
            stream: PhoneState.stream,
            builder: (context, snapshot) {
              PhoneState? status = snapshot.data;
              Constant.printLog('status Phone Number: ${status?.number}');
              if (status == null) {
                return SizedBox.shrink();
              } else if (status.number != null && status.number!.isNotEmpty) {
                controller.mobileNumber.value = status.number ?? '';

                controller.postBrandingData(
                    context: context,
                    phoneNumber: controller.mobileNumber.value);
              }
              // controller.mobileNumber.value = status.number ?? '15551505129';
              // controller.postBrandingData(
              //     context: context, phoneNumber: controller.mobileNumber.value);
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  void showError(String message) {
    Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
  }
}

class DashBoardButtons extends StatelessWidget {
  final void Function() onPress;
  final String label;
  final bool isLoading;
  final double height;
  final double width;
  const DashBoardButtons(
      {super.key,
      required this.onPress,
      required this.label,
      this.height = 35,
      this.width = 100,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: CustomButton(
          isLoading: isLoading,
          height: height,
          width: width,
          label: label,
          onPress: onPress),
    );
  }
}
    // if (status.status == PhoneStateStatus.CALL_INCOMING ||
    //                 status.status == PhoneStateStatus.CALL_STARTED) {
    //               phoneNumber = status.number;
    //               print('Phone Number: $phoneNumber');  // Log it if needed
    //             }