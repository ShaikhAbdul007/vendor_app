import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/helper/constant.dart';
import 'package:vendor_app/widgets/buttons.dart';
import '../../../helper/colors.dart';
import '../../../helper/divider.dart';
import '../../../helper/sizebox.dart';
import '../../../routes/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: Column(children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
            color: AppColors.gradientStartColor,
          ),
          accountEmail: Text(
            'sahilshaikh@gmail.com"',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.blackColor, fontSize: 15),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            radius: 50,
            child: Text('S',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 40)),
          ),
          accountName: Text(
            "Sahil Shaikh",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.blackColor, fontSize: 15),
          ),
        ),
        DrawerMenu(
            text: 'Profile',
            icon: Icons.person_sharp,
            iconColor: AppColors.greyColor,
            color: AppColors.blackColor,
            onTap: () {
              Get.back();
              MyRoutes.navigateToRoute(routeName: MyRoutes.profileScreen);
            }),
        customDivider(),
        DrawerMenu(
            text: 'Text Upload',
            icon: Icons.abc,
            iconColor: AppColors.greyColor,
            color: AppColors.blackColor,
            onTap: () {
              Get.back();
              MyRoutes.navigateToRoute(routeName: MyRoutes.textMessageScreen);
            }),
        customDivider(),
        DrawerMenu(
            text: 'Image Upload',
            icon: Icons.image,
            iconColor: AppColors.greyColor,
            color: AppColors.blackColor,
            onTap: () {
              Get.back();
              MyRoutes.navigateToRoute(routeName: MyRoutes.imageScreen);
            }),
        customDivider(),
        DrawerMenu(
            text: 'Video Upload',
            icon: Icons.videocam_outlined,
            iconColor: AppColors.greyColor,
            color: AppColors.blackColor,
            onTap: () {
              Get.back();
              MyRoutes.navigateToRoute(routeName: MyRoutes.videoScreen);
            }),
        customDivider(),
        DrawerMenu(
            text: 'Location Upload',
            icon: Icons.map,
            iconColor: AppColors.greyColor,
            color: AppColors.blackColor,
            onTap: () {
              Get.back();
              MyRoutes.navigateToRoute(routeName: MyRoutes.locationScreen);
            }),
        customDivider(),
        DrawerMenu(
            text: 'Feedback',
            icon: Icons.feed_outlined,
            iconColor: AppColors.greyColor,
            color: AppColors.blackColor,
            onTap: () {
              Get.back();
              MyRoutes.navigateToRoute(routeName: MyRoutes.feedbackScreen);
            }),
        customDivider(),
        DrawerMenu(
            text: 'Logout',
            icon: Icons.logout_rounded,
            iconColor: AppColors.greyColor,
            color: AppColors.blackColor,
            onTap: () {
              Get.back();
              Constant.printLog('Logout');
              Constant.customShowDialog(
                  context,
                  SizedBox(
                    height: 150,
                    width: 300,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Alert',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, bottom: 20),
                          child: Text(
                            'Are you sure you want to log out?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 18),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                                height: 30,
                                width: 120,
                                label: 'Yes',
                                onPress: () {
                                  MyRoutes.navigateToRoute(
                                      routeName: MyRoutes.loginScreen);
                                }),
                            CustomButton(
                                height: 30,
                                width: 120,
                                label: 'No',
                                onPress: () {
                                  Get.back();
                                })
                          ],
                        )
                      ],
                    ),
                  ));
            }),
        const Spacer(),
        setHeight(height: 5)
      ]),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color color;
  final VoidCallback onTap;

  const DrawerMenu(
      {super.key,
      required this.text,
      required this.icon,
      required this.iconColor,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 20),
      dense: false,
      minLeadingWidth: 1,
      minVerticalPadding: 15,
      title: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      onTap: onTap,
    );
  }
}
