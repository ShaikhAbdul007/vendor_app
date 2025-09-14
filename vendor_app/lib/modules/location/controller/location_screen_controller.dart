import 'package:get/get.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';
import 'package:vendor_app/network/repository.dart';
import '../../../helper/constant.dart';
import '../../../helper/error.dart';
import '../../../helper/location.dart';

class LocationScreenController extends GetxController with CacheManager {
  final repo = Repository();
  RxString longitude = RxString('');
  RxString latitude = RxString('');
  Location locations = Location();
  RxBool isLoading = RxBool(false);
  RxBool light = RxBool(false);

  @override
  void onInit() async {
    print("call locations onInit"); // this line not printing
    locations.getLocation(longitude, latitude);
    super.onInit();
  }

  sendLatLong() async {
    String? token = retriveToken();

    var result = await repo.sendLatLong(
        isLoading, token, 'location', latitude.value, longitude.value);

    if (result == true) {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: 'Location Uploaded Successfully',
          isSuccess: true);
    } else {
      Constant.getSnackBar(
          errorType: success,
          errorMessage: somethingWentWrongError,
          isSuccess: false);
    }
  }
}
