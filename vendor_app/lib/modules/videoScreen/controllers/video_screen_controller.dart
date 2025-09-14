import 'package:get/get.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';
import 'package:vendor_app/network/repository.dart';
import '../../../helper/constant.dart';
import '../../../helper/error.dart';
import '../../../helper/image_video_picker.dart';

class VideoScreenController extends GetxController with CacheManager {
  final repo = Repository();
  ImageVideoPicker imageAndVideoPicker = ImageVideoPicker();
  RxString videoPath = RxString('');
  RxBool isLoading = RxBool(false);
  RxBool light = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  sendVideo(String videoPath) async {
    Constant.printLog(videoPath);

    var token = retriveToken();
    var result =
        await repo.sendImageAndVideo(videoPath, isLoading, token, 'video');
    if (result == true) {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: 'Video Uploaded Successfully',
          isSuccess: true);
    } else {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: somethingWentWrongError,
          isSuccess: false);
      Constant.printLog('api failed');
    }
  }
}
