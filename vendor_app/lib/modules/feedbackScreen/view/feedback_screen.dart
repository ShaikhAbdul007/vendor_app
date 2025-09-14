import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/helper/sizebox.dart';
import 'package:vendor_app/modules/feedbackScreen/controller/feedbackfrom_controller.dart';

import '../../../helper/common_appbar.dart';
import '../../../widgets/textfield.dart';
import '../../dashboard/view/dashboard_screen.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FeedbackfromController controller = Get.put(FeedbackfromController());
    return CommonAppbar(
      title: 'FeedBack Form',
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            CustomTextField(
              maxLines: 1,
              hintText: 'Title',
              controller: controller.titleMessageController,
            ),
            setHeight(height: 30),
            CustomTextField(
              maxLines: 8,
              minLines: 5,
              hintText: 'Message',
              controller: controller.feedBackMessageController,
            ),
            setHeight(height: 30),
            Obx(
              () => DashBoardButtons(
                width: 300,
                isLoading: controller.isLoading.value,
                onPress: () {},
                label: "Upload",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
