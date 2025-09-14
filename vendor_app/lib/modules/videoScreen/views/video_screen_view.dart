import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vendor_app/helper/colors.dart';
import 'package:vendor_app/helper/common_appbar.dart';
import 'package:vendor_app/helper/sizebox.dart';
import 'package:vendor_app/helper/toggle.dart';

import '../../../helper/constant.dart';
import '../../../helper/error.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../controllers/video_screen_controller.dart';

class VideoScreenView extends GetView<VideoScreenController> {
  const VideoScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    VideoScreenController controller = Get.put(VideoScreenController());

    return CommonAppbar(
        title: 'Video Upload Screen',
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            setHeight(height: 50),
            Obx(() => CustomToggleButton(
                  width: 70,
                  label: 'Video',
                  isToggleEnable: controller.light.value,
                  onChanged: (value) {
                    controller.light.value = value;
                    controller.saveVideoToggleValue(controller.light.value);
                  },
                )),
            setHeight(height: 20),
            DashBoardButtons(
              width: 300,
              onPress: () {
                controller.imageAndVideoPicker.pickVideo(controller.videoPath);
              },
              label: "Select Video",
            ),
            setHeight(height: 10),
            // Obx(() => controller.videoPath.value.isNotEmpty
            //     ? Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 10),
            //         child:
            //             Text('Selected Video: ${controller.videoPath.value}'),
            //       )
            //     : const SizedBox(
            //         child: Text('No Video Selected'),
            //       )),
            setHeight(height: 20),
            Obx(
              () => DashBoardButtons(
                width: 300,
                isLoading: controller.isLoading.value,
                onPress: () {
                  if (controller.videoPath.value.isEmpty ||
                      controller.videoPath.value == null) {
                    Constant.getSnackBar(
                        errorType: failed,
                        errorMessage: noVideofileSelected,
                        isSuccess: false);
                  } else {
                    controller.sendVideo(controller.videoPath.value);
                  }
                },
                label: "Upload",
              ),
            ),
          ],
        ));
  }
}
