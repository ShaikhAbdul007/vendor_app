import 'package:flutter/material.dart';
import 'package:vendor_app/helper/colors.dart';
import '../modules/drawer/view/my_drawer.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? actionChild;
  final Widget? actionSecondChild;
  final bool isDrawerRequired;
  final bool isCenterTitle;
  final bool isleadingRequired;
  const CommonAppbar({
    super.key,
    required this.title,
    required this.body,
    this.actionChild,
    this.actionSecondChild,
    this.isDrawerRequired = false,
    this.isCenterTitle = false,
    this.isleadingRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        // leading: isleadingRequired
        //     ? Padding(
        //         padding: const EdgeInsets.only(left: 15.0),
        //         child: CircleAvatar(
        //           backgroundColor: Colors.orange.shade300,
        //           child: IconButton(
        //               onPressed: () {}, icon: const Icon(Icons.menu)),
        //         ),
        //       )
        //     : IconButton(
        //         icon: Icon(Icons.arrow_back_ios),
        //         onPressed: () {
        //           Get.back();
        //         },
        //       ),
        centerTitle: isCenterTitle ? true : null,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          actionChild ??
              const SizedBox(
                height: 0,
                width: 0,
              ),
          actionSecondChild ??
              const SizedBox(
                height: 0,
                width: 0,
              ),
        ],
      ),
      body: body,
      drawer: isDrawerRequired ? const MyDrawer() : null,
    );
  }
}
