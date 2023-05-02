import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) => ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) => json.encode(data.toJson());

class ProfileDetailsModel {
  bool? success;
  ProfileDetailsResult? result;
  String? message;

  ProfileDetailsModel({
    this.success,
    this.result,
    this.message,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) => ProfileDetailsModel(
    success: json["success"],
    result: ProfileDetailsResult.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result!.toJson(),
    "message": message,
  };
}

class ProfileDetailsResult {
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
  String? verification;
  String? city;
  String? country;
  String? phone;
  String? urlTwitter;
  String? urlGitHub;
  String? address;
  String? pincode;
  List<dynamic>? addressDefault;
  List<dynamic>? addressHome;
  List<dynamic>? addressOther;

  ProfileDetailsResult({
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
    this.verification,
    this.city,
    this.country,
    this.phone,
    this.urlTwitter,
    this.urlGitHub,
    this.address,
    this.pincode,
    this.addressDefault,
    this.addressHome,
    this.addressOther,
  });

  factory ProfileDetailsResult.fromJson(Map<String, dynamic> json) => ProfileDetailsResult(
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
    verification: json["verification"],
    city: json["city"],
    country: json["country"],
    phone: json["phone"],
    urlTwitter: json["urlTwitter"],
    urlGitHub: json["urlGitHub"],
    address: json["address"],
    pincode: json["pincode"],
    addressDefault: List<dynamic>.from(json["addressDefault"].map((x) => x)),
    addressHome: List<dynamic>.from(json["addressHome"].map((x) => x)),
    addressOther: List<dynamic>.from(json["addressOther"].map((x) => x)),
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
    "verification": verification,
    "city": city,
    "country": country,
    "phone": phone,
    "urlTwitter": urlTwitter,
    "urlGitHub": urlGitHub,
    "address": address,
    "pincode": pincode,
    "addressDefault": List<dynamic>.from(addressDefault!.map((x) => x)),
    "addressHome": List<dynamic>.from(addressHome!.map((x) => x)),
    "addressOther": List<dynamic>.from(addressOther!.map((x) => x)),
  };
}
