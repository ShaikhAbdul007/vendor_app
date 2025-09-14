import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vendor_app/helper/error.dart';
import 'package:vendor_app/modules/dashboard/model/dasboard_reponse_model.dart';
import 'package:path/path.dart';
import '../helper/constant.dart';
import '../modules/login/model/login_model.dart';
import '../modules/sign_up/model/signup_model.dart';
import 'apiend_point.dart';
import 'networking.dart';
import 'package:http/http.dart' as http;

class Repository {
  final networking = Networking();

  Future<SignUpModel> postSignUpData(dynamic body) async {
    try {
      var response = await networking.postData(
          url: '${ApiEndPoint.baseURL}${ApiEndPoint.signUpEndPoint}',
          body: body);
      if (response['status'] == failed) {
        return SignUpModel(status: failed, message: response['message']);
      } else if (response['status'] == success) {
        return response = SignUpModel.fromJson(response);
      } else {
        return SignUpModel(status: failed, message: somethingWentWrongError);
      }
    } catch (e) {
      return throw (e);
    }
  }

  Future<LoginResponseModel> postLoginData(dynamic body) async {
    try {
      var response = await networking.postData(
          url: '${ApiEndPoint.baseURL}${ApiEndPoint.loginEndPoint}',
          body: body);
      if (response['status'] == failed) {
        return LoginResponseModel(status: failed, message: response['message']);
      } else if (response['status'] == success) {
        return response = LoginResponseModel.fromJson(response);
      } else {
        return LoginResponseModel(
            status: failed, message: somethingWentWrongError);
      }
    } catch (e) {
      return throw (e);
    }
  }

  Future<DashBoardResponseModel> postDashBoardData(dynamic body) async {
    try {
      var response = await networking.postData(
          url: '${ApiEndPoint.baseURL}${ApiEndPoint.dashBoardEndPoint}',
          body: body);
      if (response['status'] == failed) {
        return DashBoardResponseModel(
            status: failed, message: response['message']);
      } else if (response['status'] == success) {
        return response = DashBoardResponseModel.fromJson(response);
      } else {
        return DashBoardResponseModel(
            status: failed, message: somethingWentWrongError);
      }
    } catch (e) {
      return throw (e);
    }
  }

  Future<DashBoardResponseModel> postSendBrandingData(dynamic body) async {
    try {
      // Make the API call
      var response = await networking.postData(
        url: '${ApiEndPoint.baseURL}${ApiEndPoint.brandingDataSendEndPoint}',
        body: body,
      );

      // Validate the response format
      if (response is! Map<String, dynamic>) {
        return DashBoardResponseModel(
          status: 'Failed',
          message: 'Invalid response format from the server',
        );
      }

      // Check the API response status
      if (response['status'] == 'Failed') {
        return DashBoardResponseModel(
          status: 'Failed',
          message: response['message'] ?? 'Unknown error',
        );
      } else if (response['status'] == 'Success') {
        // Parse the successful response
        return DashBoardResponseModel.fromJson(response);
      } else {
        return DashBoardResponseModel(
          status: 'Failed',
          message: 'Unexpected status in response',
        );
      }
    } catch (e) {
      // Log the error and return a meaningful error response
      Constant.printLog('Error in postSendBrandingData: $e');
      return DashBoardResponseModel(
        status: 'Failed',
        message: 'Something went wrong: ${e.toString()}',
      );
    }
  }

  Future<bool> sendImageAndVideo(
    String imagePath,
    RxBool isLoading,
    String token,
    String fileType,
  ) async {
    isLoading.value = true;

    var request = http.MultipartRequest('POST',
        Uri.parse("${ApiEndPoint.baseURL}${ApiEndPoint.dashBoardEndPoint}"));
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      imagePath,
      filename: basename(imagePath),
    ));
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    };

    request.fields.addAll({'mediaType': fileType});
    request.headers.addAll(headers);

    if (kDebugMode) {
      print('request.headers ${request.headers}');
      print('request.fields ${request.fields}');
      print('request.files ${request.files}');
    }

    http.StreamedResponse response = await request.send();
    final result = await response.stream.bytesToString();
    var res = DashBoardResponseModel.fromJson(jsonDecode(result));
    if (kDebugMode) {
      print('res is $res');
      print('result is $result');
      print(response.statusCode.toString());
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading.value = false;
      Constant.printLog(response);

      return true;
    } else {
      isLoading.value = false;
      Constant.printLog('api failed');
      return false;
    }
  }

  Future<bool> sendText(RxBool isLoading, String token, String fileType,
      String messageText) async {
    isLoading.value = true;

    var request = http.MultipartRequest('POST',
        Uri.parse("${ApiEndPoint.baseURL}${ApiEndPoint.dashBoardEndPoint}"));
    // request.files.add(await http.MultipartFile.fromPath(
    //   'file',
    //   imagePath,
    //   filename: basename(imagePath),
    // ));
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    };

    request.fields.addAll({'mediaType': fileType, 'text': messageText});
    request.headers.addAll(headers);

      Constant.printLog('request.headers ${request.headers}');
      Constant.printLog('request.fields ${request.fields}');
      Constant.printLog('request.files ${request.files}');
    

    http.StreamedResponse response = await request.send();
    final result = await response.stream.bytesToString();
    var res = DashBoardResponseModel.fromJson(jsonDecode(result));

    Constant.printLog('res is $res');
    Constant.printLog('result is $result');
    Constant.printLog(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading.value = false;
      Constant.printLog(response);

      return true;
    } else {
      isLoading.value = false;
      Constant.printLog('api failed');
      return false;
    }
  }

  Future<bool> sendLatLong(RxBool isLoading, String token, String fileType,
      String lat, String long) async {
    isLoading.value = true;

    var request = http.MultipartRequest('POST',
        Uri.parse("${ApiEndPoint.baseURL}${ApiEndPoint.dashBoardEndPoint}"));
    // request.files.add(await http.MultipartFile.fromPath(
    //   'file',
    //   imagePath,
    //   filename: basename(imagePath),
    // ));
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    };

    request.fields
        .addAll({'mediaType': fileType, 'latitude': lat, 'longitude': long});
    request.headers.addAll(headers);

    Constant.printLog('request.headers ${request.headers}');
    Constant.printLog('request.fields ${request.fields}');
    Constant.printLog('request.files ${request.files}');

    http.StreamedResponse response = await request.send();
    final result = await response.stream.bytesToString();
    var res = DashBoardResponseModel.fromJson(jsonDecode(result));

    Constant.printLog('res is $res');
    Constant.printLog('result is $result');
    Constant.printLog(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading.value = false;
      Constant.printLog(response);

      return true;
    } else {
      isLoading.value = false;
      Constant.printLog('api failed');
      return false;
    }
  }
}
