import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/complaint_history_model.dart';
import 'model/create_complaint_model.dart';
import 'model/get_profile_details_model.dart';
import 'model/get_service_time_model.dart';
import 'model/get_services_details.dart';
import 'model/get_user_service_categroy_model.dart';
import 'model/login.dart';
import 'model/register.dart';
import 'model/upload_image_model.dart';
import 'model/user_location_model.dart';
import 'model/user_service_history_details_model.dart';
import 'model/user_service_history_model.dart';

class APIUtils {
  final appName = 'Coolwell';
  // static const baseURL = "http://164.92.128.14:5000";
  static const baseURL = "http://139.59.30.46";


  static const String registerURL = '/register';
  static const String logInURL = '/login';
  static const String forgotEmailURL = '/forgot';
  static const String forgotEmailChangePasswordURL = '/forgotChangePassword';
  static const String getServicesURL = '/admin/ServiceList';
  static const String createComplaintURL = '/users/createcomplaint';
  static const String activateURL = '/verifyOtp';
  static const String profileUpdateURL = '/profile';
  static const String complaintHistoryURL = '/users/getComplaintHistory';
  static const String userLocationURL = '/users/storeLocation';
  static const String googleRegisterURL = '/googleregister';
  static const String sendMobileURL = '/sendMobileOtp';
  static const String uploadImageURL = '/uploadimage';
  static const String usersHistoryURL = '/users/getHistory';
  static const String serviceCategoryURL = '/admin/GetCategory';
  static const String serviceGetTimeURL = '/admin/GetServiceTime';



  Future<CommonModel> doRegisterEmail(
      String name, String phone, String email, String pass) async {
    var emailbodyData = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': pass,
    };
    final response = await http.post(Uri.parse(baseURL + registerURL),
        body: emailbodyData);
    return CommonModel.fromJson(json.decode(response.body));
  }

  Future<Login> doLoginEmail(String email, String password,) async {
    var emailbodyData = {
      'email': email,
      'password': password
    };

    final response =
    await http.post(Uri.parse(baseURL + logInURL), body: emailbodyData);

    return Login.fromJson(json.decode(response.body));
  }

  Future<CommonModel> doForgotEmail(String email) async {
    var emailbodyData = {
      'email': email,
    };

    final response =
    await http.post(Uri.parse(baseURL + forgotEmailURL), body: emailbodyData);

    return CommonModel.fromJson(json.decode(response.body));
  }

  Future<CommonModel> doForgotEmailChangePass(String email, String phone, String otp,String password,) async {
    var emailbodyData = {
      'email': email,
      'phone': "null",
      'otp': otp,
      'password': password,
    };

    var mobilebodyData = {
      'email': "null",
      'phone': phone,
      'otp': otp,
      'password': password,
    };

    final response =
    await http.post(Uri.parse(baseURL + forgotEmailChangePasswordURL), body: emailbodyData);

    return CommonModel.fromJson(json.decode(response.body));
  }

  Future<GetServiceDetails> getServicesDetails(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var emailbodyData = {
      'id': id,
    };
    final response =
    await http.post(Uri.parse(baseURL + getServicesURL), headers: requestHeaders, body: emailbodyData);
    // print(response.body);
    return GetServiceDetails.fromJson(json.decode(response.body));

  }
  Future<CommonModel> verifyOTP(
       String email, String otp) async {
    var emailbodyData = {
      'gmail': email,
      'otp': otp,
      'phone': "null",
    };
    final response = await http.post(Uri.parse(baseURL + activateURL),
        body: emailbodyData);
    print(response.body);
    return CommonModel.fromJson(json.decode(response.body));
  }

  Future<CommonModel> updateProfileDetails(String name, String profileImage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var emailbodyData = {
      "name": name,
      // 'address': address,
      // 'pincode': pincode,
      'profile_pic': profileImage
    };

    final response =
    await http.patch(Uri.parse(baseURL + profileUpdateURL), headers: requestHeaders, body: emailbodyData);

    return CommonModel.fromJson(json.decode(response.body));
  }

  Future<UploadImageModel> doUpload(String front) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var request =
    http.MultipartRequest("POST", Uri.parse(baseURL + uploadImageURL));
    request.headers['authorization'] =
        "Bearer "+preferences.getString("token").toString();
    request.headers['Accept'] = 'application/json';

    var pic = await http.MultipartFile.fromPath("image", front);
    request.files.add(pic);
    http.Response response =
    await http.Response.fromStream(await request.send());
    return UploadImageModel.fromJson(json.decode(response.body.toString()));
  }

  Future<GetProfileDetailsModel> getProfileDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };

    final response =
    await http.get(Uri.parse(baseURL + profileUpdateURL),headers: requestHeaders);
    return GetProfileDetailsModel.fromJson(json.decode(response.body));
  }

  Future<CreateComplaintDetailsModel> createComplaintDetails(String serviceid, String date, String address, String city, String zip, String lat, String lon, String amount, String type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var emailbodyData = {
      "Service_id": serviceid,
      'Date': date,
      'Address': address,
      'city': city,
      'zip': zip,
      'latitude': lat,
      'longitude': lon,
      'Amount': amount,
      'type': type,
    };

    final response =
    await http.post(Uri.parse(baseURL + createComplaintURL), headers: requestHeaders, body: emailbodyData);
    // print(response.body);
    return CreateComplaintDetailsModel.fromJson(json.decode(response.body));
  }

  Future<ComplaintHistoryModel> getComplaintDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var emailbodyData = {
      'type': "recent",
    };

    final response =
    await http.post(Uri.parse(baseURL + complaintHistoryURL), headers: requestHeaders, body: emailbodyData);

    return ComplaintHistoryModel.fromJson(json.decode(response.body));
  }

  Future<CommonModel> locationDetails(String address, String latitude, String longitude ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var bodyData = {
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };

    final response =
    await http.post(Uri.parse(baseURL + userLocationURL),headers: requestHeaders, body: bodyData);

    return CommonModel.fromJson(json.decode(response.body));
  }

  Future<CommonModel> googleRegistration(String name, String email, String type ) async {

    var bodyData = {
      'name': name,
      'email': email,
      'type': type,
    };

    final response = await http.post(Uri.parse(baseURL + googleRegisterURL), body: bodyData);
    return CommonModel.fromJson(json.decode(response.body));
  }

  Future<CommonModel> sendMobileOTP(String number ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var bodyData = {
      'phone_no': number
    };

    final response = await http.post(Uri.parse(baseURL + sendMobileURL), headers: requestHeaders, body: bodyData);
    return CommonModel.fromJson(json.decode(response.body));
  }

  Future<UsersHistoryModel> getServiceDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };

    final response =
    await http.post(Uri.parse(baseURL + usersHistoryURL), headers: requestHeaders);

    return UsersHistoryModel.fromJson(json.decode(response.body));
  }

  Future<UsersHistoryDetailsModel> getServiceFullDetails(String hisId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var bodyData = {
      '_id': hisId,
    };

    final response =
    await http.post(Uri.parse(baseURL + complaintHistoryURL),headers: requestHeaders, body: bodyData);
    return UsersHistoryDetailsModel.fromJson(json.decode(response.body));
  }

  Future<GetUserServiceCategoryModel> getUserService() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };

    final response =
    await http.get(Uri.parse(baseURL + serviceCategoryURL), headers: requestHeaders);

    return GetUserServiceCategoryModel.fromJson(json.decode(response.body));
  }

  Future<GetServiceTimeModel> getServiceTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };

    final response =
    await http.get(Uri.parse(baseURL + serviceGetTimeURL), headers: requestHeaders);

    return GetServiceTimeModel.fromJson(json.decode(response.body));
  }


}
