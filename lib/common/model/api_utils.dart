import 'dart:convert';

import 'package:coolwell_app/common/model/register.dart';
import 'package:coolwell_app/common/model/update_profile_model.dart';
import 'package:coolwell_app/common/model/user_location_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'complaint_history.dart';
import 'create_complaint.dart';
import 'get_services_details.dart';
import 'login.dart';

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

  Future<GetServiceDetails> getServicesDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    final response =
    await http.get(Uri.parse(baseURL + getServicesURL), headers: requestHeaders);
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

  Future<UpdateProfileDetailsModel> updateProfileDetails(String name, String address, String pincode,) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var emailbodyData = {
      "name": name,
      'address': address,
      'pincode': pincode
    };

    final response =
    await http.patch(Uri.parse(baseURL + profileUpdateURL), headers: requestHeaders, body: emailbodyData);

    return UpdateProfileDetailsModel.fromJson(json.decode(response.body));
  }

  Future<CreateComplaintDetails> createComplaintDetails(String serviceid, String date, String name, String address, String city, String zip, String lat, String lon, String amount,) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer "+preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    var emailbodyData = {
      "Service_id": serviceid,
      'Date': date,
      'Name': name,
      'Address': address,
      'city': city,
      'zip': zip,
      'latitude': lat,
      'longitude': lon,
      'Amount': amount
    };

    final response =
    await http.patch(Uri.parse(baseURL + createComplaintURL), headers: requestHeaders, body: emailbodyData);

    return CreateComplaintDetails.fromJson(json.decode(response.body));
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

  Future<UserLocationModel> locationDetails(String address, String latitude, String longitude ) async {
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

    return UserLocationModel.fromJson(json.decode(response.body));
  }

  Future<CommonModel> googleRegistration(String name, String email, String type ) async {

    var bodyData = {
      'name': name,
      'email': email,
      'type': type,
    };

    final response =
    await http.post(Uri.parse(baseURL + googleRegisterURL), body: bodyData);

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

    final response =
    await http.post(Uri.parse(baseURL + sendMobileURL), headers: requestHeaders, body: bodyData);

    return CommonModel.fromJson(json.decode(response.body));
  }



}
