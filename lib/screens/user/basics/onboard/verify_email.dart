import 'package:coolwell_app/common/model/api_utils.dart';
import 'package:coolwell_app/common/model/register.dart';
import 'package:coolwell_app/common/textformfield_custom.dart';
import 'package:coolwell_app/screens/user/basics/onboard/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';


class EmailViaScreen extends StatefulWidget {
  final String mail;
  final String type;
  const EmailViaScreen({Key? key, required this.mail, required this.type}) : super(key: key);

  @override
  State<EmailViaScreen> createState() => _EmailViaScreenState();
}

class _EmailViaScreenState extends State<EmailViaScreen> {

  String type="";

  FocusNode codeFocus = FocusNode();
  TextEditingController codeController = TextEditingController();
  APIUtils apiUtils=APIUtils();
  bool loading=false;

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
                .text("loc_email_send"),
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
                .text("loc_email_send_txt1"),
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
            widget.mail.toString(),
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                16.0,
                Theme.of(context).splashColor.withOpacity(0.5),
                FontWeight.w600,
                'FontRegular'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.0,),
          Image.asset("assets/images/email_send.png", height: 100.0,),
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
                SizedBox(height: 10.0,),
                TextFormFieldCustom(
                  onEditComplete: () {
                    codeFocus.unfocus();
                    // FocusScope.of(context).requestFocus(phoneNumFocus);
                  },
                  radius: 6.0,
                  error: "Enter Full Name",
                  textColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).dividerColor,
                  fillColor: Theme.of(context).focusColor,
                  hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                      16.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w600, 'FontRegular'),
                  textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                      16.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
                  textInputAction: TextInputAction.next,
                  focusNode: codeFocus,
                  maxlines: 1,
                  text: '',
                  hintText: "otp",
                  obscureText: false,
                  textChanged: (value) {},
                  onChanged: () {},
                  suffix: Container(
                    width: 0.0,
                  ),
                  validator: (value) {

                  },
                  enabled: true,
                  textInputType: TextInputType.number,
                  controller: codeController,
                ),
                SizedBox(height: 5.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/verified.svg", height: 14.0,),
                    SizedBox(width: 5.0,),
                    Text(
                      AppLocalizations.instance
                          .text("loc_success"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).indicatorColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text(
                      AppLocalizations.instance
                          .text("loc_did_rcv_email"),
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
                SizedBox(height: 20.0,),
              ],
            ),
          ),

          Container(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      print(codeController.text);

                      if(codeController.text.toString().isNotEmpty)
                        {
                          loading=true;
                          doVerify();

                        }
                      else{
                        CustomWidget(context: context).  custombar("Verify Account", "Please Enter OTP to Verify", false);
                      }

                    });
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
    );
  }
  doVerify() {
    print(widget.mail);
    apiUtils
        .verifyOTP(
        widget.mail.toString(),codeController.text.toString()
    )
        .then((CommonModel loginData) {
      if (loginData.success!) {
        setState(() {
          loading = false;
        });
        CustomWidget(context: context).  custombar("Verify Account", loginData.message.toString(), true);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) =>
                    SignUp_Screen()));


      } else {
        setState(() {
          loading = false;
          CustomWidget(context: context).  custombar("Verify Account", loginData.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      print("he;");
      print(error);
      setState(() {
        loading = false;
      });
    });
  }
}
