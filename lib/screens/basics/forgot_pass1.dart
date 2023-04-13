import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Forgot_Password1 extends StatefulWidget  {
  const Forgot_Password1({Key? key}) : super(key: key);

  @override
  State<Forgot_Password1> createState() => _Forgot_Password1State();
}

class _Forgot_Password1State extends State<Forgot_Password1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset("assets/images/back.png", fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),

            contentUI(),

          ],
        ),
      ),
    );
  }


  Widget contentUI(){
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      size: 15.0,
                    ),
                  ),
                ),
              ),flex: 1,),
              SizedBox(width: 20.0,),
              Flexible(child: Text(
                AppLocalizations.instance
                    .text("loc_forgot_password"),
                style: CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    18.0,
                    Theme.of(context).focusColor,
                    FontWeight.w600,
                    'FontRegular'),
                textAlign: TextAlign.center,
              ),flex: 4,),
            ],
          ),
          SizedBox(height: 20.0,),

          Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0),child: Text(
            AppLocalizations.instance
                .text("loc_forgot_pass_txt1"),
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                16.0,
                Theme.of(context).focusColor,
                FontWeight.w600,
                'FontRegular'),
            textAlign: TextAlign.center,

          ),),
        ],
      ),
    );
  }

}
