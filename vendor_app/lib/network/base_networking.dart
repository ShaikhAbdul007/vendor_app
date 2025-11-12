abstract class BaseNetworking {
  Future<dynamic> getData({required url});
  Future<dynamic> postData({required url, required body});

  // Future<dynamic> putData({
  //   required url,
  //   required body,
  // });
}
