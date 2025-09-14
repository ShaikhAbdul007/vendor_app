import 'package:get/get.dart';
import 'package:vendor_app/helper/unknown_route.dart';
import 'package:vendor_app/modules/bottom_navigation/view/bottom_navigation_screen.dart';
import 'package:vendor_app/modules/dashboard/view/dashboard_screen.dart';
import 'package:vendor_app/modules/drawer/view/my_drawer.dart';
import 'package:vendor_app/modules/location/view/location_screen_view.dart';
import 'package:vendor_app/modules/login/view/login_screen.dart';
import 'package:vendor_app/modules/notification/view/notification_screen.dart';
import 'package:vendor_app/modules/payment_histroy/view/payment_history_screen.dart';
import 'package:vendor_app/modules/profile/view/profile_screen.dart';
import 'package:vendor_app/modules/sign_up/view/sign_up_screen.dart';
import 'package:vendor_app/modules/splash/view/splash_screen.dart';
import '../modules/feedbackScreen/view/feedback_screen.dart';
import '../modules/imageScreen/views/image_screen_view.dart';
import '../modules/package/view/package.dart';
import '../modules/textMessageScreen/views/text_message_screen_view.dart';
import '../modules/videoScreen/views/video_screen_view.dart';

class MyRoutes {
  MyRoutes._();

  static const loginScreen = '/loginScreen';
  static const splashScreen = '/splashScreen';
  static const profileScreen = '/profileScreen';
  static const dashBoardScreen = '/dashBoardScreen';
  static const signUpSreen = '/signUpSreen';
  static const bottomNavigationScreen = '/bottomNavigationScreen';
  static const paymentScreen = '/paymentScreen';
  static const notificationScreen = '/notificationScreen';
  static const packageScreen = '/packageScreen';
  static const drawerScreen = '/drawerScreen';
  static const imageScreen = '/imageScreen';
  static const videoScreen = '/videoScreen';
  static const textMessageScreen = '/textMessageScreen';
  static const unknownRoute = '/unknownRoute';
  static const locationScreen = '/locationScreen';
  static const feedbackScreen = '/feedbackScreen';

  static List<GetPage> viewPages = [
    GetPage(name: '/loginScreen', page: () => const LoginScreen()),
    GetPage(name: '/unknownRoute', page: () => const UnknownRoute()),
    GetPage(name: '/signUpSreen', page: () => const SignUpScreen()),
    GetPage(name: '/dashBoardScreen', page: () => const DashboardScreen()),
    GetPage(name: '/drawerScreen', page: () => const MyDrawer()),
    GetPage(name: '/profileScreen', page: () => const ProfileScreen()),
    GetPage(name: '/splashScreen', page: () => const SplashScreen()),
    GetPage(name: '/packageScreen', page: () => const PackageScreen()),
    GetPage(
        name: '/notificationScreen', page: () => const NotificationScreen()),
    GetPage(name: '/paymentScreen', page: () => const PaymentHistoryScreen()),
    GetPage(
        name: '/bottomNavigationScreen',
        page: () => const BottomNavigationScreen()),
    GetPage(
      name: '/imageScreen',
      page: () => const ImageScreenView(),
    ),
    GetPage(
      name: '/videoScreen',
      page: () => const VideoScreenView(),
    ),
    GetPage(
      name: '/textMessageScreen',
      page: () => const TextMessageScreenView(),
    ),
    GetPage(
      name: '/locationScreen',
      page: () => const LocationScreenView(),
    ),
    GetPage(
      name: '/feedbackScreen',
      page: () => const FeedbackScreen(),
    ),
  ];

  static navigateToRoute({required String routeName, dynamic data}) {
    switch (routeName) {
      case splashScreen:
        Get.offAllNamed(splashScreen);
        break;
      case loginScreen:
        Get.offAllNamed(loginScreen);
        break;
      case signUpSreen:
        Get.toNamed(signUpSreen, arguments: data);
        break;
      case bottomNavigationScreen:
        Get.offAllNamed(bottomNavigationScreen, arguments: data);
        break;
      case profileScreen:
        Get.toNamed(profileScreen);
      case dashBoardScreen:
        Get.toNamed(dashBoardScreen);
        break;
      case notificationScreen:
        Get.toNamed(notificationScreen);
        break;
      case paymentScreen:
        Get.toNamed(paymentScreen);
        break;
      case packageScreen:
        Get.toNamed(packageScreen);
        break;
      case imageScreen:
        Get.toNamed(imageScreen);
        break;
      case videoScreen:
        Get.toNamed(videoScreen);
        break;
      case textMessageScreen:
        Get.toNamed(textMessageScreen);
        break;
      case locationScreen:
        Get.toNamed(locationScreen);
        break;
      case feedbackScreen:
        Get.toNamed(feedbackScreen);
        break;
      default:
        Get.toNamed(unknownRoute);
    }
  }
}
