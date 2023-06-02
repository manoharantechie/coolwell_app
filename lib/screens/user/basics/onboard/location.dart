
import 'package:coolwell_app/screens/user/basics/home.dart';
import 'package:coolwell_app/screens/user/service/service.dart';
import 'package:coolwell_app/screens/user/basics/onboard/location_success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../profile/location_Screen.dart';

class LocationLoginScreen extends StatefulWidget {
  final double lat;
  final double long ;
  const LocationLoginScreen({Key? key, required this.lat, required this.long}) : super(key: key);

  @override
  State<LocationLoginScreen> createState() => _LocationLoginScreenState();
}

class _LocationLoginScreenState extends State<LocationLoginScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
    getData();
    lat=widget.lat;
    long=widget.long;
  }

  double lat = 0.00;
  double long = 0.00;
  String address="";
  getPermission() async {
    if (await Permission.location
        .request()
        .isGranted) {
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
        _getAddress(position.latitude, position.longitude);
      });
    }).catchError((e) {

    });
  }

  getData()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {
      address=preferences.getString("address").toString();
    });
  }

  storeData(String address)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString("address", address);
    preferences.setString("lat", lat.toString());
    preferences.setString("long", long.toString());
  }

  _getAddress(double lat, double lang) async {

    try {
      List<Placemark> p = await placemarkFromCoordinates(lat, lang);

      Placemark place = p[0];

      setState(() {
        address=place.name.toString()+" ,"+place.thoroughfare.toString()+" ,"+place.locality.toString()+" ,"+ place.postalCode.toString();
        storeData(address);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/back.png", fit: BoxFit.fill, width: MediaQuery
                .of(context)
                .size
                .width,),

            contentUI(),

          ],
        ),
      ),
    );
  }


  Widget contentUI() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.instance
                .text("loc_location_hint"),
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                16.0,
                Theme
                    .of(context)
                    .focusColor,
                FontWeight.w600,
                'FontRegular'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.0,),
          Text(
            AppLocalizations.instance
                .text("loc_location_hint_1"),
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                26.0,
                Theme
                    .of(context)
                    .focusColor,
                FontWeight.w600,
                'FontRegular'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0,),
          SvgPicture.asset("assets/images/map_pin.svg", height: 50.0,),
          SizedBox(height: 25.0,),
          InkWell(
            onTap: () {
              _getCurrentLocation();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Home_Screen()));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Theme
                    .of(context)
                    .shadowColor,
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.my_location_sharp,
                    size: 18.0,
                    color: Theme
                        .of(context)
                        .focusColor,
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    AppLocalizations.instance
                        .text("loc_current_location"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        16.0,
                        Theme
                            .of(context)
                            .focusColor,
                        FontWeight.w800,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.0,),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Location_Screen(lat: lat, long: long,)));
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //      Location_Success_Screen()));
              // Location_Screen(lat: lat,long: long,)));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.transparent,
                  border: Border.all(width: 1.0, color: Theme
                      .of(context)
                      .cardColor,)
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/search.svg",
                    height: 18.0,
                    color: Theme
                        .of(context)
                        .focusColor,
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    AppLocalizations.instance
                        .text("loc_some_location"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        16.0,
                        Theme
                            .of(context)
                            .focusColor,
                        FontWeight.w800,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}