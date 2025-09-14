class UserProfileResponse {
  String? name;
  String? mobile;
  String? shopName;
  String? email;
  String? address;
  String? package;

  UserProfileResponse({
    this.name,
    this.mobile,
    this.shopName,
    this.email,
    this.address,
    this.package,
  });
  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      name: json['name'],
      mobile: json['mobile'],
      shopName: json['shopName'],
      email: json['email'],
      address: json['address'],
      package: json['package'],
    );
  }

  // Method to convert UserProfileResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
      'shopName': shopName,
      'email': email,
      'address': address,
      'package': package,
    };
  }
}
