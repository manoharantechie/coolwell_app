
import 'package:coolwell_app/screens/user/basics/splash_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String address="";
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    address = preferences.getString("first").toString();
    onLoad();
  }

  onLoad() {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => SplashHomeScreen()));
        });


    // if (address.toString() == "" ||
    //     address.toString() == null ||
    //     address.toString() == "null") {
    //   setState(() {
    //
    //     Future.delayed(const Duration(seconds: 5), () {
    //       // Navigator.of(context)
    //       //     .pushReplacement(MaterialPageRoute(builder: (context) => OnboardScreen()));
    //     });
    //     // checkDeviceID(deviceData['device_id'].toString());
    //   });
    // } else {
    //   Future.delayed(const Duration(seconds: 5), () {
    //     // Navigator.of(context)
    //     //     .pushReplacement(MaterialPageRoute(builder: (context) => SplashHomeScreen()));
    //   });
    // }
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
