import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:vendor_app/helper/constant.dart';
import 'package:app_settings/app_settings.dart';

class Location {
  Future<LocationPermission> checkAndRequestPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showError('Location services are disabled');

      AppSettings.openAppSettings(type: AppSettingsType.location);
      return LocationPermission.denied;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppSettings.openAppSettings(type: AppSettingsType.location);
        showError('Location permissions are denied');
      }
    }

    return permission;
  }

  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await checkAndRequestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return null;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }

  Future<void> getLocation(RxString location ,RxString latitude) async {
    Position? position = await getCurrentLocation();
    if (position != null) {
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      location.value = '${position.longitude}';
      latitude.value = '${position.latitude}';
    } else {
      showError('Unable to get location. Permission denied.');
    }
  }

  void showError(String message) {
    Constant.getSnackBar(
        errorType: 'Error', errorMessage: message, isSuccess: false);
  }
}
