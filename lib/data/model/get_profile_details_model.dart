import 'dart:convert';

GetProfileDetailsModel getProfileDetailsModelFromJson(String str) => GetProfileDetailsModel.fromJson(json.decode(str));

String getProfileDetailsModelToJson(GetProfileDetailsModel data) => json.encode(data.toJson());

class GetProfileDetailsModel {
  bool? success;
  GetProfileResult? result;
  String? message;

  GetProfileDetailsModel({
    this.success,
    this.result,
    this.message,
  });

  factory GetProfileDetailsModel.fromJson(Map<String, dynamic> json) => GetProfileDetailsModel(
    success: json["success"],
    result: GetProfileResult.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result!.toJson(),
    "message": message,
  };
}

class GetProfileResult {
  String? profilePic;
  dynamic addressDefault;
  Address? addressHome;
  List<Address>? addressOther;
  String? id;
  String? name;
  String? email;
  String? phone;

  GetProfileResult({
    this.profilePic,
    this.addressDefault,
    this.addressHome,
    this.addressOther,
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory GetProfileResult.fromJson(Map<String, dynamic> json) => GetProfileResult(
    profilePic: json["profile_pic"],
    addressDefault: json["addressDefault"],
    addressHome: json["addressHome"]==null || json["addressHome"]=="null"?Address():Address.fromJson(json["addressHome"]),
    addressOther: json["addressOther"]==null || json["addressOther"]=="null"?[]:List<Address>.from(json["addressOther"].map((x) => Address.fromJson(x))),
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "profile_pic": profilePic,
    "addressDefault": addressDefault,
    "addressHome": addressHome!.toJson(),
    "addressOther": List<dynamic>.from(addressOther!.map((x) => x.toJson())),
    "_id": id,
    "name": name,
    "email": email,
    "phone": phone,
  };
}

class Address {
  dynamic address;
  dynamic city;
  String? zip;
  String? longitude;
  String? latitude;

  Address({
    this.address,
    this.city,
    this.zip,
    this.longitude,
    this.latitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["Address"],
    city: json["city"],
    zip: json["zip"],
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "Address": address,
    "city": city,
    "zip": zip,
    "longitude": longitude,
    "latitude": latitude,
  };
}

