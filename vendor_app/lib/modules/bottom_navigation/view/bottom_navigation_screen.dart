import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/modules/package/view/package.dart';
import '../../../helper/colors.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../payment_histroy/view/payment_history_screen.dart';
import '../controller/bottom_navigation_controller.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    int iconIndex = bottomNavigationController.currentIndex.value;
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.currentIndex.value,
          children: const [
            DashboardScreen(),
            PackageScreen(),
            PaymentHistoryScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: bottomNavigationController.currentIndex.value,
            onTap: (index) => bottomNavigationController.changeIndex(index),
            elevation: 10,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  color: AppColors.gradientStartColor,
                ),
                activeIcon: Icon(
                  size: iconIndex == 0 ? 40 : 30,
                  Icons.dashboard_outlined,
                  color: AppColors.gradientStartColor,
                ),
                label: 'DashBoard',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.price_change,
                  color: AppColors.gradientStartColor,
                ),
                activeIcon: Icon(
                  size: iconIndex == 0 ? 40 : 30,
                  Icons.price_change,
                  color: AppColors.gradientStartColor,
                ),
                label: 'Subscription',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.swap_horiz,
                  color: AppColors.gradientStartColor,
                ),
                activeIcon: Icon(
                  size: iconIndex == 0 ? 40 : 30,
                  Icons.swap_horiz,
                  color: AppColors.gradientStartColor,
                ),
                label: 'Payment History',
              ),
            ]),
      ),
    );
  }
}
