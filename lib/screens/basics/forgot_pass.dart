import 'package:coolwell_app/screens/basics/email.dart';
import 'package:coolwell_app/screens/basics/location.dart';
import 'package:coolwell_app/screens/basics/otp_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Forgot_Password extends StatefulWidget  {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {

  bool email = true;
  bool otp = false;
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
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      size: 22.0,
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
                    26.0,
                    Theme.of(context).focusColor,
                    FontWeight.w600,
                    'FontRegular'),
                textAlign: TextAlign.center,
              ),flex: 4,),
            ],
          ),
          SizedBox(height: 25.0,),

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
          SizedBox(height: 40.0,),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      email =true;
                      otp =false;
                    });
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                EmailViaScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: email ? BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0,color: Theme.of(context).cardColor,)
                    ): BoxDecoration(),
                    child: Image.asset("assets/images/email.png", height: 100.0,),
                  ),
                ),
                SizedBox(height: 5.0,),
                Text(
                  AppLocalizations.instance
                      .text("loc_via_email"),
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      16.0,
                      Theme.of(context).focusColor,
                      FontWeight.w600,
                      'FontRegular'),
                ),
              ],
            ),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        email =false;
                        otp =true;
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    OTP_Screen()));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: otp ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 3.0,color: Theme.of(context).cardColor,)
                      ) : BoxDecoration(),
                      child: Image.asset("assets/images/otp.png", height: 100.0,),
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    AppLocalizations.instance
                        .text("loc_via_otp"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        16.0,
                        Theme.of(context).focusColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 40.0,),
         Align(
           alignment: Alignment.center,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               InkWell(
                 onTap: (){
                   Navigator.of(context).push(
                       MaterialPageRoute(
                           builder: (context) =>
                               LocationLoginScreen()));
                 },
                 child: Container(
                   width: MediaQuery.of(context).size.width * 0.6,
                   padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                   decoration: BoxDecoration(
                     // border: Border.all(
                     //   width: 1.0,
                     //   color: Theme.of(context).cardColor,
                     // ),
                     borderRadius: BorderRadius.circular(20.0),
                     color: Theme.of(context).buttonColor,
                   ),
                   child: Center(
                     child: Text(
                       AppLocalizations.instance
                           .text("loc_continue"),
                       style: CustomWidget(context: context)
                           .CustomSizedTextStyle(
                           17.0,
                           Theme.of(context).focusColor,
                           FontWeight.w600,
                           'FontRegular'),
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 30.0,),
               Text(
                 AppLocalizations.instance
                     .text("loc_forgot_txt1"),
                 style: CustomWidget(context: context)
                     .CustomSizedTextStyle(
                     16.0,
                     Theme.of(context).focusColor,
                     FontWeight.w600,
                     'FontRegular'),
                 textAlign: TextAlign.center,

               ),
               SizedBox(height: 10.0,),
               Text(
                 AppLocalizations.instance
                     .text("loc_forgot_txt2"),
                 style: CustomWidget(context: context)
                     .CustomSizedTextStyle(
                     16.0,
                     Theme.of(context).hintColor,
                     FontWeight.w600,
                     'FontRegular'),
                 textAlign: TextAlign.center,

               ),

             ],
           ),
         )
        ],
      ),
    );
  }

}
