import 'dart:convert';

UpdateProfileDetailsModel updateProfileDetailsModelFromJson(String str) => UpdateProfileDetailsModel.fromJson(json.decode(str));

String updateProfileDetailsModelToJson(UpdateProfileDetailsModel data) => json.encode(data.toJson());

class UpdateProfileDetailsModel {
  bool? success;
  UpdateProfileResult? result;
  String? message;

  UpdateProfileDetailsModel({
    this.success,
    this.result,
    this.message,
  });

  factory UpdateProfileDetailsModel.fromJson(Map<String, dynamic> json) => UpdateProfileDetailsModel(
    success: json["success"],
    result: UpdateProfileResult.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result!.toJson(),
    "message": message,
  };
}

class UpdateProfileResult {
  dynamic techId;
  dynamic twofa;
  bool? verified;
  bool? google;
  bool? facebook;
  dynamic status;
  bool? gmailVerified;
  bool? phoneVerified;
  String? name;
  String? email;
  AddressDefault? addressDefault;
  List<dynamic>? addressHome;
  List<dynamic>? addressOther;
  String? gmailOtp;
  String? address;
  String? pincode;

  UpdateProfileResult({
    this.techId,
    this.twofa,
    this.verified,
    this.google,
    this.facebook,
    this.status,
    this.gmailVerified,
    this.phoneVerified,
    this.name,
    this.email,
    this.addressDefault,
    this.addressHome,
    this.addressOther,
    this.gmailOtp,
    this.address,
    this.pincode,
  });

  factory UpdateProfileResult.fromJson(Map<String, dynamic> json) => UpdateProfileResult(
    techId: json["Tech_id"],
    twofa: json["twofa"],
    verified: json["verified"],
    google: json["google"],
    facebook: json["facebook"],
    status: json["status"],
    gmailVerified: json["gmail_verified"],
    phoneVerified: json["phone_verified"],
    name: json["name"],
    email: json["email"],
    addressDefault: AddressDefault.fromJson(json["addressDefault"]),
    addressHome: List<dynamic>.from(json["addressHome"].map((x) => x)),
    addressOther: List<dynamic>.from(json["addressOther"].map((x) => x)),
    gmailOtp: json["gmail_otp"],
    address: json["address"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "Tech_id": techId,
    "twofa": twofa,
    "verified": verified,
    "google": google,
    "facebook": facebook,
    "status": status,
    "gmail_verified": gmailVerified,
    "phone_verified": phoneVerified,
    "name": name,
    "email": email,
    "addressDefault": addressDefault!.toJson(),
    "addressHome": List<dynamic>.from(addressHome!.map((x) => x)),
    "addressOther": List<dynamic>.from(addressOther!.map((x) => x)),
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
