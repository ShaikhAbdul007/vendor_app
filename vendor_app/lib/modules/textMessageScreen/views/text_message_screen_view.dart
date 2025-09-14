import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vendor_app/helper/common_appbar.dart';
import 'package:vendor_app/helper/sizebox.dart';

import '../../../helper/toggle.dart';
import '../../../widgets/textfield.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../controllers/text_message_screen_controller.dart';

class TextMessageScreenView extends StatelessWidget {
  const TextMessageScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    TextMessageScreenController controller =
        Get.put(TextMessageScreenController());
    return CommonAppbar(
        title: 'Text Upload',
        body: Column(
          children: [
            setHeight(height: 50),
            Obx(() => CustomToggleButton(
                  isToggleEnable: controller.light.value,
                  onChanged: (value) {
                    controller.light.value = value;
                    controller.saveTextToggleValue(controller.light.value);
                  },
                  label: 'Text',
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: CustomTextField(
                maxLines: 8,
                minLines: 5,
                hintText: 'Message',
                controller: controller.messageController,
              ),
            ),
            Obx(
              () => DashBoardButtons(
                width: 300,
                isLoading: controller.isLoading.value,
                onPress: () {
                  controller.sendText();
                },
                label: "Upload",
              ),
            ),
          ],
        ));
  }
}
