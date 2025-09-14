class DashBoardResponseModel {
  String? status;
  int? statusCode;
  String? message;

  DashBoardResponseModel({
    this.status,
    this.statusCode,
    this.message,
  });

  DashBoardResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;

    return data;
  }
}
