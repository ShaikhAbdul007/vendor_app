import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vendor_app/Cache%20Manager/cache_manager.dart';
import 'package:vendor_app/network/base_networking.dart';
import '../helper/constant.dart';
import '../helper/error.dart';

class Networking extends BaseNetworking with CacheManager {
  @override
  Future getData({required url}) async {
    dynamic jsonGetResposne;
    String? token;
    token = checkingTokenExpireOrNot();

    try {
      var response = await http.get(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      });

      jsonGetResposne = await fetchResponse(response);
    } on SocketException {
      return Future.error(internetError);
    } on HttpException {
      return Future.error(httpError);
    } on Exception catch (e) {
      return Future.error(e);
    }
    return jsonGetResposne;
  }

  @override
  Future postData({
    required url,
    required body,
  }) async {
    dynamic jsonPostResponse;
    String? token;
    token = checkingTokenExpireOrNot();
    Constant.printLog('token is $token');
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
        body: jsonEncode(body),
      );

      jsonPostResponse = await fetchResponse(response);
    } on SocketException {
      return Future.error(internetError);
    } on HttpException {
      return Future.error(httpError);
    } on Exception catch (e) {
      return Future.error(e);
    }
    return jsonPostResponse;
  }

  // @override
  // Future putData({required url, required body}) async {
  //   dynamic jsonPutResponse;
  //   String? token = retriveToken();
  //   try {
  //     var response = await http.put(
  //       Uri.parse(url),
  //       headers: <String, String>{
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': "Bearer $token"
  //       },
  //       body: jsonEncode(body),
  //     );

  //     jsonPutResponse = await fetchResponse(response);
  //   } on SocketException {
  //     return Future.error(internetError);
  //   } on HttpException {
  //     return Future.error(httpError);
  //   } on Exception catch (e) {
  //     return Future.error(e);
  //   }
  //   return jsonPutResponse;
  // }

  Future<dynamic> fetchResponse(http.Response response) async {
    dynamic data;
    switch (response.statusCode) {
      case 200:
        data = jsonDecode(response.body);
        break;
      case 201:
        data = jsonDecode(response.body);
        break;
      case 400:
        data = jsonDecode(response.body);
        break;
      case 401:
        data = jsonDecode(response.body);
        break;
      case 404:
        data = jsonDecode(response.body);
        break;
      case 500:
        data = jsonDecode(response.body);
        break;
      default:
        {
          data = 'Request Failed';
        }
    }
    return data;
  }

  String? checkingTokenExpireOrNot() {
    var token = retriveToken();
    return token;
  }
}
