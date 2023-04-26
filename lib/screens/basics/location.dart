import 'package:coolwell_app/screens/basics/location_success.dart';
import 'package:coolwell_app/screens/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class LocationLoginScreen extends StatefulWidget {
  const LocationLoginScreen({Key? key}) : super(key: key);

  @override
  State<LocationLoginScreen> createState() => _LocationLoginScreenState();
}

class _LocationLoginScreenState extends State<LocationLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset("assets/images/back.png", fit: BoxFit.fill,width: MediaQuery.of(context).size.width,),

            contentUI(),

          ],
        ),
      ),
    );
  }


  Widget contentUI(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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
                Theme.of(context).focusColor,
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
                Theme.of(context).focusColor,
                FontWeight.w600,
                'FontRegular'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0,),
          SvgPicture.asset("assets/images/map_pin.svg", height: 50.0,),
          SizedBox(height: 25.0,),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Location_Success_Screen()));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Theme.of(context).buttonColor,
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.my_location_sharp,
                    size: 18.0,
                    color:  Theme.of(context).focusColor,
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    AppLocalizations.instance
                        .text("loc_current_location"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        16.0,
                        Theme.of(context).focusColor,
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
            onTap: (){

            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.transparent,
                  border: Border.all(width: 1.0, color: Theme.of(context).cardColor,)
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/search.svg",
                    height: 18.0,
                    color:  Theme.of(context).focusColor,
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    AppLocalizations.instance
                        .text("loc_some_location"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        16.0,
                        Theme.of(context).focusColor,
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
