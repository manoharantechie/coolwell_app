import 'dart:convert';

GetServiceDetails getServiceDetailsFromJson(String str) => GetServiceDetails.fromJson(json.decode(str));

String getServiceDetailsToJson(GetServiceDetails data) => json.encode(data.toJson());

class GetServiceDetails {
  GetServiceDetails({
    this.success,
    this.result,
    this.message,
  });

  bool? success;
  List<Result>? result;
  String? message;

  factory GetServiceDetails.fromJson(Map<String, dynamic> json) => GetServiceDetails(
    success: json["success"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class Result {
  Result({
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

  List<String>? checkList;
  List<String>? coverImage;
  String? id;
  String? serviceName;
  String? category;
  String? amount;
  String? time;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    checkList: List<String>.from(json["Check_List"].map((x) => x)),
    coverImage: List<String>.from(json["Cover_Image"].map((x) => x)),
    id: json["_id"],
    serviceName: json["Service_Name"],
    category: json["Category"],
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
    "Category": category,
    "Amount": amount,
    "Time": time,
    "Notes": notes,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
