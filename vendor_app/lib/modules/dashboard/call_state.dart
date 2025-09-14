import 'package:permission_handler/permission_handler.dart';

class CustomCallState {
  Future<bool> requestPermission() async {
    PermissionStatus status = await Permission.phone.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      await Permission.phone.request();
    }
    return false;
  }
}
