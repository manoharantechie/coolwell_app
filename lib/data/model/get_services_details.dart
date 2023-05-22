import 'dart:convert';

GetServiceDetails getServiceDetailsFromJson(String str) => GetServiceDetails.fromJson(json.decode(str));

String getServiceDetailsToJson(GetServiceDetails data) => json.encode(data.toJson());

class GetServiceDetails {
  bool? success;
  List<GetServiceResult>? result;
  String? message;

  GetServiceDetails({
    this.success,
    this.result,
    this.message,
  });

  factory GetServiceDetails.fromJson(Map<String, dynamic> json) => GetServiceDetails(
    success: json["success"],
    result: List<GetServiceResult>.from(json["result"].map((x) => GetServiceResult.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class GetServiceResult {
  List<String>? checkList;
  List<String>? coverImage;
  String? id;
  String? serviceName;
  GetServiceCategory? category;
  String? amount;
  String? time;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetServiceResult({
    this.checkList,
    this.coverImage,
    this.id,
    this.serviceName,
    this.category,
    this.amount,
    this.time,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory GetServiceResult.fromJson(Map<String, dynamic> json) => GetServiceResult(
    checkList: List<String>.from(json["Check_List"].map((x) => x)),
    coverImage: List<String>.from(json["Cover_Image"].map((x) => x)),
    id: json["_id"],
    serviceName: json["Service_Name"],
    category: GetServiceCategory.fromJson(json["Category"]),
    amount: json["Amount"],
    time: json["Time"],
    notes: json["Notes"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Check_List": List<dynamic>.from(checkList!.map((x) => x)),
    "Cover_Image": List<dynamic>.from(coverImage!.map((x) => x)),
    "_id": id,
    "Service_Name": serviceName,
    "Category": category!.toJson(),
    "Amount": amount,
    "Time": time,
    "Notes": notes,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

class GetServiceCategory {
  String? offer;
  bool? status;
  String? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetServiceCategory({
    this.offer,
    this.status,
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory GetServiceCategory.fromJson(Map<String, dynamic> json) => GetServiceCategory(
    offer: json["offer"],
    status: json["status"],
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "offer": offer,
    "status": status,
    "_id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
