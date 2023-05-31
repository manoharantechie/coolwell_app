import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/custom_widget.dart';
import '../../../../common/localization/localizations.dart';
import '../../../../common/otp_fields/otp_field_custom.dart';
import '../../../../common/otp_fields/style.dart';
import '../../../../common/textformfield_custom.dart';

class Login_Mobile_Otp_Screen extends StatefulWidget {
  const Login_Mobile_Otp_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Mobile_Otp_Screen> createState() => _Login_Mobile_Otp_ScreenState();
}

class _Login_Mobile_Otp_ScreenState extends State<Login_Mobile_Otp_Screen> {

  final emailformKey = GlobalKey<FormState>();
  bool loading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

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

            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: emailformKey,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.instance
                              .text("loc_verify_num"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              27.0,
                              Theme.of(context).focusColor,
                              FontWeight.w700,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.0,),
                        Text(
                          AppLocalizations.instance
                              .text("loc_phone_sent_txt1"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              16.0,
                              Theme.of(context).focusColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          AppLocalizations.instance
                              .text("loc_tummy_num"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              16.0,
                              Theme.of(context).focusColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30.0,),
                        Image.asset("assets/images/otp.png", height: 100.0,),
                        Container(
                          padding: EdgeInsets.only(left: 15.0,right: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.instance
                                    .text("loc_enter_code"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    16.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 15.0,),
                              OTPTextField(
                                length: 6,
                                width: MediaQuery.of(context).size.width,
                                fieldWidth: 45,
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textFieldAlignment: MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.underline,
                                onCompleted: (pin) {
                                  print("Completed: " + pin);
                                },
                              ),

                              SizedBox(height: 30.0,),
                              SizedBox(height: 20.0,),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    loading=true;
                                    // sentOTP();
                                  });
                                },
                                child:  Row(
                                  children: [
                                    Text(
                                      "Didn't receive OTP?",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          16.0,
                                          Theme.of(context).secondaryHeaderColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(
                                      AppLocalizations.instance
                                          .text("loc_resend"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          16.0,
                                          Theme.of(context).cardColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),

                                  ],
                                ),
                              ),

                              SizedBox(height: 20.0,),
                            ],
                          ),
                        ),

                        Container(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                                  decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   width: 1.0,
                                    //   color: Theme.of(context).cardColor,
                                    // ),
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Theme.of(context).indicatorColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.instance
                                          .text("loc_done"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          16.0,
                                          Theme.of(context).focusColor,
                                          FontWeight.w800,
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
                  )
                ],
              ),
            ),
            loading
                ? CustomWidget(context: context).loadingIndicator(
              Theme.of(context).cardColor,
            )
                : Container()

          ],
        ),
      ),
    );
  }


}
