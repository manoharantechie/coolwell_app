import 'dart:convert';

UserLocationModel userLocationModelFromJson(String str) => UserLocationModel.fromJson(json.decode(str));

String userLocationModelToJson(UserLocationModel data) => json.encode(data.toJson());

class UserLocationModel {
  bool? success;
  UserLocationResult? result;
  String? message;

  UserLocationModel({
    this.success,
    this.result,
    this.message,
  });

  factory UserLocationModel.fromJson(Map<String, dynamic> json) => UserLocationModel(
    success: json["success"],
    result: UserLocationResult.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result!.toJson(),
    "message": message,
  };
}

class UserLocationResult {
  dynamic techId;
  dynamic twofa;
  String? role;
  bool? verified;
  bool? google;
  bool? facebook;
  dynamic status;
  bool? gmailVerified;
  bool? phoneVerified;
  String? id;
  String? name;
  String? email;
  AddressDefault? addressDefault;
  List<dynamic>? addressHome;
  List<dynamic>? addressOther;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? gmailOtp;
  String? address;
  String? pincode;

  UserLocationResult({
    this.techId,
    this.twofa,
    this.role,
    this.verified,
    this.google,
    this.facebook,
    this.status,
    this.gmailVerified,
    this.phoneVerified,
    this.id,
    this.name,
    this.email,
    this.addressDefault,
    this.addressHome,
    this.addressOther,
    this.createdAt,
    this.updatedAt,
    this.gmailOtp,
    this.address,
    this.pincode,
  });

  factory UserLocationResult.fromJson(Map<String, dynamic> json) => UserLocationResult(
    techId: json["Tech_id"],
    twofa: json["twofa"],
    role: json["role"],
    verified: json["verified"],
    google: json["google"],
    facebook: json["facebook"],
    status: json["status"],
    gmailVerified: json["gmail_verified"],
    phoneVerified: json["phone_verified"],
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    addressDefault: AddressDefault.fromJson(json["addressDefault"]),
    addressHome: List<dynamic>.from(json["addressHome"].map((x) => x)),
    addressOther: List<dynamic>.from(json["addressOther"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    gmailOtp: json["gmail_otp"],
    address: json["address"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "Tech_id": techId,
    "twofa": twofa,
    "role": role,
    "verified": verified,
    "google": google,
    "facebook": facebook,
    "status": status,
    "gmail_verified": gmailVerified,
    "phone_verified": phoneVerified,
    "_id": id,
    "name": name,
    "email": email,
    "addressDefault": addressDefault!.toJson(),
    "addressHome": List<dynamic>.from(addressHome!.map((x) => x)),
    "addressOther": List<dynamic>.from(addressOther!.map((x) => x)),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "gmail_otp": gmailOtp,
    "address": address,
    "pincode": pincode,
  };
}

class AddressDefault {
  String? address;
  String? latitude;
  String? longitude;

  AddressDefault({
    this.address,
    this.latitude,
    this.longitude,
  });

  factory AddressDefault.fromJson(Map<String, dynamic> json) => AddressDefault(
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
  };
}
