import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Location_Success_Screen extends StatefulWidget {
  const Location_Success_Screen({Key? key}) : super(key: key);

  @override
  State<Location_Success_Screen> createState() => _Location_Success_ScreenState();
}

class _Location_Success_ScreenState extends State<Location_Success_Screen> {
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
          SvgPicture.asset("assets/images/checkbox.svg", height: 50.0,),
          Container(
            width: 1.0,
            height: 25.0,
            color: Theme.of(context).selectedRowColor,
          ),
          SizedBox(height: 2.0,),
          Text(
            AppLocalizations.instance
                .text("loc_location_service"),
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                14.0,
                Theme.of(context).selectedRowColor,
                FontWeight.w600,
                'FontRegular'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.0,),

          Text(
            "Lorem ipsum dolor sit amet",
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                20.0,
                Theme.of(context).focusColor,
                FontWeight.w800,
                'FontRegular'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.0,),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Sed ut cras magna vulputate mi tempor nisl risus. ",
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                14.0,
                Theme.of(context).focusColor,
                FontWeight.w600,
                'FontRegular'),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}
