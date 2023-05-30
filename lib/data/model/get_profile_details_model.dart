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
  List<Address>? addressOther;
  String? id;
  String? name;
  String? email;
  Address? addressDefault;
  Address? addressHome;
  String? profilePic;
  String? phone;

  GetProfileResult({
    this.addressOther,
    this.id,
    this.name,
    this.email,
    this.addressDefault,
    this.addressHome,
    this.profilePic,
    this.phone,
  });

  factory GetProfileResult.fromJson(Map<String, dynamic> json) => GetProfileResult(
    addressOther: List<Address>.from(json["addressOther"].map((x) => Address.fromJson(x))),
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    addressDefault: Address.fromJson(json["addressDefault"]) == null ? null :Address.fromJson(json["addressDefault"]),
    addressHome: Address.fromJson(json["addressHome"])  == null ? null : Address.fromJson(json["addressHome"]),
    profilePic: json["profile_pic"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "addressOther": List<dynamic>.from(addressOther!.map((x) => x.toJson())),
    "_id": id,
    "name": name,
    "email": email,
    "addressDefault": addressDefault!.toJson() == null ? null : addressDefault!.toJson(),
    "addressHome": addressHome!.toJson() == null ? null : addressHome!.toJson(),
    "profile_pic": profilePic,
    "phone": phone,
  };
}

class Address {
  String? address;
  String? city;
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
