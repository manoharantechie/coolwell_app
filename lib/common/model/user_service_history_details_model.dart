import 'dart:convert';

UsersHistoryDetailsModel usersHistoryDetailsModelFromJson(String str) => UsersHistoryDetailsModel.fromJson(json.decode(str));

String usersHistoryDetailsModelToJson(UsersHistoryDetailsModel data) => json.encode(data.toJson());

class UsersHistoryDetailsModel {
  bool? success;
  String? message;
  UsersHistoryResult? result;

  UsersHistoryDetailsModel({
    this.success,
    this.message,
    this.result,
  });

  factory UsersHistoryDetailsModel.fromJson(Map<String, dynamic> json) => UsersHistoryDetailsModel(
    success: json["success"],
    message: json["message"],
    result: UsersHistoryResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result!.toJson(),
  };
}

class UsersHistoryResult {
  List<Id>? technicianId;
  List<String>? checklist;
  List<String>? attachment;
  List<String>? notes;
  dynamic serviceStatus;
  String? id;
  ServiceId? serviceId;
  String? taskTitle;
  String? category;
  DateTime? startTime;
  DateTime? endTime;
  String? location;
  String? latitude;
  String? longitude;
  Id? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  UsersHistoryResult({
    this.technicianId,
    this.checklist,
    this.attachment,
    this.notes,
    this.serviceStatus,
    this.id,
    this.serviceId,
    this.taskTitle,
    this.category,
    this.startTime,
    this.endTime,
    this.location,
    this.latitude,
    this.longitude,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory UsersHistoryResult.fromJson(Map<String, dynamic> json) => UsersHistoryResult(
    technicianId: List<Id>.from(json["Technician_id"].map((x) => Id.fromJson(x))),
    checklist: List<String>.from(json["Checklist"].map((x) => x)),
    attachment: List<String>.from(json["Attachment"].map((x) => x)),
    notes: List<String>.from(json["Notes"].map((x) => x)),
    serviceStatus: json["service_status"],
    id: json["_id"],
    serviceId: ServiceId.fromJson(json["Service_id"]),
    taskTitle: json["Task_Title"],
    category: json["Category"],
    startTime: DateTime.parse(json["Start_Time"]),
    endTime: DateTime.parse(json["End_Time"]),
    location: json["Location"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    userId: Id.fromJson(json["User_id"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Technician_id": List<dynamic>.from(technicianId!.map((x) => x.toJson())),
    "Checklist": List<dynamic>.from(checklist!.map((x) => x)),
    "Attachment": List<dynamic>.from(attachment!.map((x) => x)),
    "Notes": List<dynamic>.from(notes!.map((x) => x)),
    "service_status": serviceStatus,
    "_id": id,
    "Service_id": serviceId!.toJson(),
    "Task_Title": taskTitle,
    "Category": category,
    "Start_Time": startTime!.toIso8601String(),
    "End_Time": endTime!.toIso8601String(),
    "Location": location,
    "latitude": latitude,
    "longitude": longitude,
    "User_id": userId!.toJson(),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

class ServiceId {
  dynamic serviceStatus;
  String? id;
  String? serviceId;
  dynamic date;
  String? name;
  String? address;
  String? city;
  String? zip;
  String? latitude;
  String? longitude;
  dynamic amount;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ServiceId({
    this.serviceStatus,
    this.id,
    this.serviceId,
    this.date,
    this.name,
    this.address,
    this.city,
    this.zip,
    this.latitude,
    this.longitude,
    this.amount,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    serviceStatus: json["service_status"],
    id: json["_id"],
    serviceId: json["Service_id"],
    date: json["Date"],
    name: json["Name"],
    address: json["Address"],
    city: json["city"],
    zip: json["zip"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    amount: json["Amount"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "service_status": serviceStatus,
    "_id": id,
    "Service_id": serviceId,
    "Date": date,
    "Name": name,
    "Address": address,
    "city": city,
    "zip": zip,
    "latitude": latitude,
    "longitude": longitude,
    "Amount": amount,
    "user_id": userId,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

class Id {
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
  String? city;
  String? area;
  String? pincode;
  String? longitude;
  String? latitude;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? address;
  String? profilePic;
  String? phone;
  AddressDefault? addressDefault;
  List<dynamic>? addressHome;
  List<dynamic>? addressOther;
  String? gmailOtp;

  Id({
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
    this.city,
    this.area,
    this.pincode,
    this.longitude,
    this.latitude,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.profilePic,
    this.phone,
    this.addressDefault,
    this.addressHome,
    this.addressOther,
    this.gmailOtp,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
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
    city: json["city"],
    area: json["Area"],
    pincode: json["pincode"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    email: json["email"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    address: json["address"],
    profilePic: json["profile_pic"],
    phone: json["phone"],
    addressDefault: AddressDefault.fromJson(json["addressDefault"]),
    addressHome: List<dynamic>.from(json["addressHome"].map((x) => x)),
    addressOther: List<dynamic>.from(json["addressOther"].map((x) => x)),
    gmailOtp: json["gmail_otp"],
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
    "city": city,
    "Area": area,
    "pincode": pincode,
    "longitude": longitude,
    "latitude": latitude,
    "email": email,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "address": address,
    "profile_pic": profilePic,
    "phone": phone,
    "addressDefault": addressDefault!.toJson(),
    "addressHome": List<dynamic>.from(addressHome!.map((x) => x)),
    "addressOther": List<dynamic>.from(addressOther!.map((x) => x)),
    "gmail_otp": gmailOtp,
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
