import 'dart:convert';

import 'package:coolwell_app/common/model/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'get_services_details.dart';
import 'login.dart';

class APIUtils {
  final appName = 'Coolwell';
  static const baseURL = "http://164.92.128.14:5000";
 // static const baseURL = "http://3.236.113.186";


  static const String registerURL = '/register';
  static const String logInURL = '/login';
  static const String forgotEmailURL = '/forgot';
  static const String getServicesURL = '/admin/ServiceList';


  Future<Register> doRegisterEmail(
      String name, String phone, String email, String pass) async {
    var emailbodyData = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': pass,
    };
    final response = await http.post(Uri.parse(baseURL + registerURL),
        body: emailbodyData);
    return Register.fromJson(json.decode(response.body));
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

  Future<GetServiceDetails> getServicesDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    final response =
    await http.get(Uri.parse(baseURL + getServicesURL), headers: requestHeaders);
    return GetServiceDetails.fromJson(json.decode(response.body));
  }

}
