import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/helper/constant.dart';

class ImageVideoPicker {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(RxString imagePath) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      if (await image.length() <= 3 * 1024 * 1024) {
        imagePath.value = image.path;
      } else {
        showError('Image size should be less than 3 MB');
      }
    }
  }

  Future<void> pickVideo(RxString videoPath) async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      if (await video.length() <= 5 * 1024 * 1024) {
        videoPath.value = video.path;
      } else {
        showError('Video size should be less than 5 MB');
      }
    }
  }

  void showError(String message) {
    Constant.getSnackBar(
        errorType: 'Error', errorMessage: message, isSuccess: false);
  }
}
