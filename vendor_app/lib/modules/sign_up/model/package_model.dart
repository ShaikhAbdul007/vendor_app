class PackageModel {
  List<PackageList>? packageList;

  PackageModel({this.packageList});

  PackageModel.fromJson(Map<String, dynamic> json) {
    if (json['packageList'] != null) {
      packageList = <PackageList>[];
      json['packageList'].forEach((v) {
        packageList!.add(PackageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (packageList != null) {
      data['packageList'] = packageList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackageList {
  String? packageName;
  int? packagePrice;

  PackageList({this.packageName, this.packagePrice});

  PackageList.fromJson(Map<String, dynamic> json) {
    packageName = json['packageName'];
    packagePrice = json['packagePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['packageName'] = packageName;
    data['packagePrice'] = packagePrice;
    return data;
  }
}
