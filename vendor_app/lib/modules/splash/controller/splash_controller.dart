import 'package:get/get.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController with CacheManager {
//  late VideoPlayerController videoPlayerController;
  var isVideoInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () async {
      bool isLoggedIn = await retriveUserLoggedIn();
      if (isLoggedIn) {
        MyRoutes.navigateToRoute(routeName: MyRoutes.bottomNavigationScreen);
      } else {
        MyRoutes.navigateToRoute(routeName: MyRoutes.loginScreen);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
