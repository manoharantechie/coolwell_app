import 'package:coolwell_app/common/text_field_custom_prefix.dart';
import 'package:coolwell_app/common/textformfield_custom.dart';
import 'package:coolwell_app/screens/user/basics/onboard/login.dart';
import 'package:coolwell_app/screens/user/basics/onboard/verify_email.dart';
import 'package:coolwell_app/screens/user/basics/onboard/verify_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';

import '../../../../data/api_utils.dart';
import '../../../../data/model/register.dart';

class SentOtpScreen extends StatefulWidget {
  final bool type;

  const SentOtpScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<SentOtpScreen> createState() => _SentOtpScreenState();
}

class _SentOtpScreenState extends State<SentOtpScreen> {
  String type = "";

  FocusNode codeFocus = FocusNode();

  APIUtils apiUtils = APIUtils();
  bool loading = false;
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode phoneNumFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/back.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),
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

  Widget contentUI() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sent OTP",
            style: CustomWidget(context: context).CustomSizedTextStyle(27.0,
                Theme.of(context).focusColor, FontWeight.w700, 'FontRegular'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          widget.type
              ? TextFormCustom(
                  onEditComplete: () {
                    emailFocus.unfocus();
                  },
                  radius: 6.0,
                  error: "Enter Email",
                  textColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).dividerColor,
                  fillColor: Theme.of(context).focusColor,
                  hintStyle: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor.withOpacity(0.3),
                          FontWeight.w500,
                          'FontRegular'),
                  textStyle: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w500,
                          'FontRegular'),
                  textInputAction: TextInputAction.next,
                  focusNode: emailFocus,
                  maxlines: 1,
                  text: '',
                  hintText: "Email",
                  obscureText: false,
                  textChanged: (value) {},
                  onChanged: () {},
                  suffix: Container(
                    width: 0.0,
                  ),
                  prefix: Container(
                    child: Icon(
                      Icons.mail,
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                  ),
                  validator: (value) {
                    if (emailController.text.isEmpty) {
                      return "Please Enter Email Details";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text)) {
                      return "Please enter valid email format";
                    }
                  },
                  enabled: true,
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                )
              : TextFormCustom(
                  onEditComplete: () {
                    phoneNumFocus.unfocus();
                    FocusScope.of(context).requestFocus(emailFocus);
                  },
                  radius: 6.0,
                  error: "Enter Phone Number",
                  textColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).dividerColor,
                  fillColor: Theme.of(context).focusColor,
                  hintStyle: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor.withOpacity(0.3),
                          FontWeight.w500,
                          'FontRegular'),
                  textStyle: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w500,
                          'FontRegular'),
                  textInputAction: TextInputAction.next,
                  focusNode: phoneNumFocus,
                  maxlines: 1,
                  text: '',
                  hintText: "Phone Number",
                  obscureText: false,
                  textChanged: (value) {},
                  onChanged: () {},
                  suffix: Container(
                    width: 0.0,
                  ),
                  prefix: Container(
                    child: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                  ),
                  validator: (value) {
                    if (phoneNumController.text.isEmpty) {
                      return "Please Enter Phone Number";
                    }
                    // else if(!RegExp("/^[a-zA-Z0-9!@#\$%\^\&*\)\(+=._-]{10,}$/g")
                    //     .hasMatch(phoneNumController.text)) {
                    //   return "Please Enter Valid Phone Number";
                    // }
                    else if (phoneNumController.text.length < 10) {
                      return "Please Enter Valid Phone Number ";
                    } else if (phoneNumController.text.length > 10) {
                      return "Please Enter Valid Phone Number";
                    }
                  },
                  enabled: true,
                  textInputType: TextInputType.phone,
                  controller: phoneNumController,
                ),
          SizedBox(
            height: 35.0,
          ),
          Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {

                      if (widget.type) {
                        if (emailController.text.toString().isNotEmpty) {
                          loading = true;
                          doVerify();
                        } else {
                          CustomWidget(context: context).custombar(
                              "Forgot Password", "Please Enter Mail ID", false);
                        }
                      } else {
                        if (phoneNumController.text.toString().isNotEmpty) {
                          loading = true;
                          doverifyMobile();
                        } else {
                          CustomWidget(context: context).custombar(
                              "Forgot Password",
                              "Please Enter Mobile Number",
                              false);
                        }
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
                        AppLocalizations.instance.text("loc_continue"),
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
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  doVerify() {
    apiUtils
        .doForgotEmail(emailController.text.toString())
        .then((CommonModel loginData) {
      if (loginData.success!) {
        setState(() {
          loading = false;
        });

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => EmailViaScreen(
                  mail: emailController.text.toString(),
                  type: "forgot",
                )));
      } else {
        setState(() {
          loading = false;
          CustomWidget(context: context).custombar(
              "Forgot Password", loginData.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }

  doverifyMobile() {
    apiUtils
        .sendMobileOTP(phoneNumController.text.toString())
        .then((CommonModel loginData) {
      if (loginData.success!) {
        setState(() {
          loading = false;
        });
        CustomWidget(context: context)
            .custombar("Forgot Password", loginData.message.toString(), true);

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => OTP_Screen(
                  mobile: phoneNumController.text.toString(),
                  type: "forgot",
                )));
      } else {
        setState(() {
          loading = false;
          CustomWidget(context: context).custombar(
              "Forgot Password", loginData.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
}
