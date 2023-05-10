import 'dart:convert';

GetAssignedJobsListModel getAssignedJobsListModelFromJson(String str) => GetAssignedJobsListModel.fromJson(json.decode(str));

String getAssignedJobsListModelToJson(GetAssignedJobsListModel data) => json.encode(data.toJson());

class GetAssignedJobsListModel {
  bool? success;
  List<GetAssignedResult>? result;
  String? message;

  GetAssignedJobsListModel({
    this.success,
    this.result,
    this.message,
  });

  factory GetAssignedJobsListModel.fromJson(Map<String, dynamic> json) => GetAssignedJobsListModel(
    success: json["success"],
    result: List<GetAssignedResult>.from(json["result"].map((x) => GetAssignedResult.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class GetAssignedResult {
  String? id;
  String? serviceName;
  String? category;
  String? amount;
  dynamic date;
  String? jobId;

  GetAssignedResult({
    this.id,
    this.serviceName,
    this.category,
    this.amount,
    this.date,
    this.jobId,
  });

  factory GetAssignedResult.fromJson(Map<String, dynamic> json) => GetAssignedResult(
    id: json["_id"],
    serviceName: json["Service_Name"],
    category: json["Category"],
    amount: json["Amount"],
    date: json["Date"],
    jobId: json["job_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Service_Name": serviceName,
    "Category": category,
    "Amount": amount,
    "Date": date,
    "job_id": jobId,
  };
}
