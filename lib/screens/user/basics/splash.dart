
import 'package:coolwell_app/screens/user/basics/home.dart';
import 'package:coolwell_app/screens/user/basics/splash_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboard/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String address="";
  String first="";
  double lat = 0.00;
  double long = 0.00;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    address = preferences.getString("token").toString();
    first = preferences.getString("first").toString();
    getPermission();

  }
  getPermission() async {
    if (await Permission.location.request().isGranted) {
      _getCurrentLocation();
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      if (statuses[Permission.location] == PermissionStatus.granted) {
        _getCurrentLocation();
      }
    }
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        lat = position.latitude;
        long = position.longitude;
        _getAddress(lat,long);
      });
    }).catchError((e) {

    });
  }
  _getAddress(double lat, double lang) async {

    try {
      List<Placemark> p = await placemarkFromCoordinates(lat, lang);

      Placemark place = p[0];

      setState(() {
      String   addreses=place.name.toString()+" ,"+place.thoroughfare.toString()+" ,"+place.locality.toString()+" ,"+ place.postalCode.toString();
        storeData(addreses);
      onLoad();


      });
    } catch (e) {}
  }
  storeData(String address)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString("address", address);
    preferences.setString("lat", lat.toString());
    preferences.setString("long", long.toString());

  }

  onLoad() {


       if (first.toString() == "" ||
           first.toString() == null ||
           first.toString() == "null") {

         Future.delayed(const Duration(seconds: 5), () {
           Navigator.of(context)
               .pushReplacement(MaterialPageRoute(builder: (context) => WelcomeScreen()));
         });
       }




  else  if (address.toString() == "" ||
        address.toString() == null ||
        address.toString() == "null") {
      setState(() {

        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => SplashHomeScreen()));
        });
        // checkDeviceID(deviceData['device_id'].toString());
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                Home_Screen()));
      });

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color:  Theme.of(context).backgroundColor,
          padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
          child: Center(
            child: Image.asset("assets/images/logoo.png", height: 150.0,),
            // child: SvgPicture.asset(
            //   'assets/images/logo.svg',
            //   height: 150.0,
            //   // color: Color(0xFF0DD8FF),
            //
            // )
          ),
        ),
      )
    );
  }
}
