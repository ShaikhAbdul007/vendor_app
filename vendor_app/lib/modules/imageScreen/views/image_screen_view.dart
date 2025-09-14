import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/helper/common_appbar.dart';
import 'package:vendor_app/helper/sizebox.dart';
import '../../../helper/constant.dart';
import '../../../helper/error.dart';
import '../../../helper/toggle.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../controllers/image_screen_controller.dart';

class ImageScreenView extends StatelessWidget {
  const ImageScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    ImageScreenController controller = Get.put(ImageScreenController());

    return CommonAppbar(
        title: 'Image Upload',
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            setHeight(height: 50),
            Obx(() => CustomToggleButton(
                  width: 70,
                  isToggleEnable: controller.light.value,
                  onChanged: (value) {
                    controller.light.value = value;
                    controller.saveImageToggleValue(controller.light.value);
                  },
                  label: 'Image',
                )),
            setHeight(height: 20),
            DashBoardButtons(
              width: 300,
              onPress: () {
                controller.imageAndVideoPicker.pickImage(controller.imagePath);
              },
              label: "Select Image",
            ),
            setHeight(height: 10),
            // Obx(() => controller.imagePath.value.isNotEmpty
            //     ? Text('Selected Image: ${controller.imagePath.value}')
            //     : const SizedBox(
            //         child: Text('No Image Selected'),
            //       )),
            setHeight(height: 20),
            Obx(
              () => DashBoardButtons(
                width: 300,
                isLoading: controller.isLoading.value,
                onPress: () {
                  if (controller.imagePath.value.isEmpty ||
                      controller.imagePath.value == null) {
                    Constant.getSnackBar(
                        errorType: failed,
                        errorMessage: noImagefileSelected,
                        isSuccess: false);
                  } else {
                    controller.sendImage(controller.imagePath.value);
                  }
                },
                label: "Upload",
              ),
            ),
          ],
        ));
  }
}
