import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/helper/common_appbar.dart';
import 'package:vendor_app/helper/sizebox.dart';

import '../../../helper/toggle.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../controller/location_screen_controller.dart';

class LocationScreenView extends StatelessWidget {
  const LocationScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    LocationScreenController controller = Get.put(LocationScreenController());
    return CommonAppbar(
      title: 'Location Upload ',
      body: Column(
        children: [
          setHeight(height: 50),
          Obx(() => CustomToggleButton(
                width: 70,
                isToggleEnable: controller.light.value,
                onChanged: (value) {
                  controller.light.value = value;
                  controller.saveLocationToggleValue(controller.light.value);
                },
                label: 'Location',
              )),
          setHeight(height: 20),
          DashBoardButtons(
            width: 300,
            onPress: () {
              controller.locations
                  .getLocation(controller.longitude, controller.latitude);
            },
            label: "Select Location",
          ),
          setHeight(height: 10),
          // Obx(() => controller.longitude.value.isNotEmpty
          //     ? Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         child: Text(
          //             'Location: ${controller.longitude.value}, ${controller.latitude.value}'),
          //       )
          //     : Container()),
          setHeight(height: 10),
          Obx(
            () => DashBoardButtons(
              width: 300,
              isLoading: controller.isLoading.value,
              onPress: () {
                controller.sendLatLong();
              },
              label: "Upload",
            ),
          ),
        ],
      ),
    );
  }
}
