import 'package:get_storage/get_storage.dart';

import '../modules/profile/model/user_profile_response.dart';

mixin class CacheManager {
  final box = GetStorage();

  //--------------------Save all the value------------------------------------------------------------------------------

  saveUserLoggedIn(bool value) {
    box.write(Key.userLoginIn.toString(), value);
  }

  saveVideoToggleValue(bool value) {
    box.write(Key.videoToggle.toString(), value);
  }

  saveImageToggleValue(bool value) {
    box.write(Key.imageToggle.toString(), value);
  }

  saveLocationToggleValue(bool value) {
    box.write(Key.locationToggle.toString(), value);
  }

  saveTextToggleValue(bool value) {
    box.write(Key.textToogle.toString(), value);
  }

  saveToken(String token) {
    box.write(Key.tokenKey.toString(), token);
  }

  saveUserDetails(UserProfileResponse userProfileResponse) {
    final userDetails = userProfileResponse.toJson();
    box.write(Key.userProfileResponse.toString(), userDetails);
  }

  //----------------- Retrieve all the value------------------------------------------------------------------------------

  String retriveToken() {
    box.writeIfNull(Key.tokenKey.toString(), '');
    return box.read(Key.tokenKey.toString());
  }

  Future<bool> retriveUserLoggedIn() async {
    box.writeIfNull(Key.userLoginIn.toString(), false);
    return box.read(Key.userLoginIn.toString());
  }

  Future<bool> retriveVideoToggleValue() async {
    box.writeIfNull(Key.videoToggle.toString(), false);
    return box.read(Key.videoToggle.toString());
  }

  Future<bool> retriveImageToggleValue() async {
    box.writeIfNull(Key.imageToggle.toString(), false);
    return box.read(Key.imageToggle.toString());
  }

  Future<bool> retriveLocationToggleValue() async {
    box.writeIfNull(Key.locationToggle.toString(), false);
    return box.read(Key.locationToggle.toString());
  }

  Future<bool> retriveTextToggleValue() async {
    box.writeIfNull(Key.textToogle.toString(), false);
    return box.read(Key.textToogle.toString());
  }

  UserProfileResponse retriveUserDetails() {
    final userDetails = box.read(Key.userProfileResponse.toString());
    if (userDetails != null) {
      return UserProfileResponse.fromJson(userDetails);
    }
    return UserProfileResponse();
  }

  //----------------- checking expire token------------------------------------------------------------------------------

  bool isTokenExpired(int expireInSeconds, DateTime loginTime) {
    DateTime expiryDateTime = loginTime.add(Duration(seconds: expireInSeconds));
    DateTime currentDateTime = DateTime.now();
    return currentDateTime.isAfter(expiryDateTime);
  }

  //----------------- Remove all the value------------------------------------------------------------------------------

  removeBox() {
    box.erase();
  }
}

enum Key {
  tokenKey,
  userLoginIn,
  userProfileResponse,
  textToogle,
  videoToggle,
  imageToggle,
  locationToggle
}
