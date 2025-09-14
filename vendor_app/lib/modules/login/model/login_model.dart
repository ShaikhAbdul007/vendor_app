class LoginResponseModel {
  String? status;
  int? statusCode;
  String? message;
  String? token;

  LoginResponseModel({this.status, this.statusCode, this.message, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    token = json['data']?['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (token != null) {
      data['data'] = {'token': token};
    }
    return data;
  }
}
