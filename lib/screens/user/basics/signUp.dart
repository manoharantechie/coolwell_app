import 'package:coolwell_app/common/country.dart';
import 'package:coolwell_app/common/model/api_utils.dart';
import 'package:coolwell_app/common/model/login.dart';
import 'package:coolwell_app/common/text_field_custom_prefix.dart';
import 'package:coolwell_app/common/theme/custom_theme.dart';
import 'package:coolwell_app/screens/user/service/service.dart';
import 'package:coolwell_app/screens/user/basics/dashboard.dart';
import 'package:coolwell_app/screens/user/basics/forgot_pass.dart';
import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({Key? key}) : super(key: key);

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {

  APIUtils apiUtils = APIUtils();
  bool loading = false;
  var snackBar;
  Country? _selectedCountry;
  bool mobileUIdesign = true;
  FocusNode mobileFocus = FocusNode();
  bool mobileVerify = true;
  TextEditingController mobile = TextEditingController();
  bool countryB = false;
  bool passVisible = false;
  bool checkHide=false;
  FocusNode nameFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final emailformKey = GlobalKey<FormState>();


  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
      countryB = true;
    });
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: mobileUIdesign ? Container(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.instance
                        .text("loc_hey"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).focusColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    AppLocalizations.instance
                        .text("loc_welcome_txt"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        30.0,
                        Theme.of(context).focusColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  SizedBox(height: 30.0,),

                  TextFormCustom(
                    onEditComplete: () {
                      nameFocus.unfocus();
                      FocusScope.of(context).requestFocus(passFocus);
                    },
                    radius: 6.0,
                    error: "Enter Username or mail",
                    textColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).dividerColor,
                    fillColor: Theme.of(context).focusColor,
                    hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                    textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                    textInputAction: TextInputAction.next,
                    focusNode: nameFocus,
                    maxlines: 1,
                    text: '',
                    hintText: "Username or mail",
                    obscureText: false,
                    textChanged: (value) {},
                    onChanged: () {},
                    suffix: Container(
                      width: 0.0,
                    ),
                    prefix: Container(
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                    ),
                    validator: (value) {
                      if(nameController.text.isEmpty) {
                        return "Please Enter Email Details";
                      } else if(!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(nameController.text)) {
                        return "Please enter valid email format";
                      }
                    },
                    enabled: true,
                    textInputType: TextInputType.name,
                    controller: nameController,
                  ),
                  SizedBox(height: 15.0,),
                  TextFormCustom(
                    onEditComplete: () {
                      passFocus.unfocus();
                      // FocusScope.of(context).requestFocus(newPassFocus);
                    },
                    radius: 6.0,
                    error: "Enter Password",
                    textColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).dividerColor,
                    fillColor: Theme.of(context).focusColor,
                    hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                    textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                    textInputAction: TextInputAction.next,
                    focusNode: passFocus,
                    maxlines: 1,
                    text: '',
                    hintText: "Password",
                    obscureText: !passVisible,
                    textChanged: (value) {},
                    onChanged: () {},
                    suffix: IconButton(

                      icon: Icon(
                        passVisible ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                      onPressed: () {
                        setState(() {
                          passVisible = !passVisible;
                        });
                      },
                    ),
                    prefix: Container(
                      child: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                    ),
                    validator: (value) {
                      if(passController.text.isEmpty) {
                        return "Please Enter Password ";
                      }
                      // else if( passController.text.length< 8 ) {
                      //   return "Please enter must not be less than 8 character";
                      // } else if(passController.text.length> 14){
                      //   return "Please enter must not be greater than 14 character";
                      // }
                    },
                    enabled: true,
                    textInputType: TextInputType.text,
                    controller: passController,
                  ),
                  SizedBox(height: 20.0,),

                  Align(
                      alignment: Alignment.center,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Forgot_Password()));
                            },
                            child: Text(
                                AppLocalizations.instance
                                    .text("loc_forgot_pass"),
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14.0,
                                    color: Theme
                                        .of(context)
                                        .secondaryHeaderColor,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal
                                ),
                                textAlign: TextAlign.start),
                          ),
                          SizedBox(height: 30.0,),
                          InkWell(
                            onTap: (){
                              if (emailformKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                  verifyMail();
                                });
                              }
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>
                              //         Home_Screen()));
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
                                      .text("loc_signup"),
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
                          SizedBox(height: 25.0,),
                        ],
                      )
                  ),
                ],
              ),
              key: emailformKey,
            ),
          ) : mobileUI(),flex: 3,),
          Flexible(child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 1.0,
                      color: Theme.of(context).dividerColor,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      AppLocalizations.instance
                          .text("loc_or"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).secondaryHeaderColor,
                          FontWeight.w600,
                          'FontRegular'),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 1.0,
                      color: Theme.of(context).dividerColor,
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(width: 1.0, color: Theme.of(context).dividerColor,)
                            ),
                            // child: SvgPicture.asset("assets/images/g_logo.svg", height: 25.0,),
                            child: Image.asset("assets/images/g_logo.png", height: 25.0,),
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            AppLocalizations.instance
                                .text("loc_google_txt"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).bottomAppBarColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                        ],
                      ),
                      // SizedBox(width: 15.0,),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(width: 1.0, color: Theme.of(context).dividerColor,)
                            ),
                            // child: SvgPicture.asset("assets/images/g_logo.svg", height: 25.0,),
                            child: Image.asset("assets/images/f_logo.png", height: 25.0,),
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            AppLocalizations.instance
                                .text("loc_fb_txt"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).bottomAppBarColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 35.0,),
                Text(
                  AppLocalizations.instance
                      .text("loc_terms_txt"),
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      14.0,
                      Theme.of(context).secondaryHeaderColor,
                      FontWeight.w600,
                      'FontRegular'),
                ),
              ],
            ),
          ),flex: 1,)
        ],
      ),
    );
  }

  Widget mobileUI(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.instance
                .text("loc_hey"),
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                18.0,
                Theme.of(context).focusColor,
                FontWeight.w600,
                'FontRegular'),
          ),
          SizedBox(height: 5.0,),
          Text(
            AppLocalizations.instance
                .text("loc_welcome_txt"),
            style: CustomWidget(context: context)
                .CustomSizedTextStyle(
                30.0,
                Theme.of(context).focusColor,
                FontWeight.w600,
                'FontRegular'),
          ),
          SizedBox(height: 30.0,),

          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15.0),
          //       border: Border.all(
          //           color: Theme.of(context).secondaryHeaderColor,
          //           width: 1.0)),
          //   padding: EdgeInsets.only(left: 1.0, right: 3.0,top: 1.0),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         padding: const EdgeInsets.only(
          //             left: 7.0,
          //             right: 10.0,
          //             top: 14.0,
          //             bottom: 18.0),
          //         decoration: BoxDecoration(
          //           color: Theme.of(context).focusColor,
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(5.0),
          //             bottomLeft: Radius.circular(5.0),
          //           ),
          //         ),
          //         child: Row(
          //           children: [
          //             InkWell(
          //               onTap: _onPressedShowBottomSheet,
          //               child: Row(
          //                 children: [
          //                   countryB
          //                       ? Image.asset(
          //                     _selectedCountry!.flag
          //                         .toString(),
          //                     package:
          //                     "country_calling_code_picker",
          //                     height: 15.0,
          //                     width: 25.0,
          //                   )
          //                       : Container(
          //                     width: 0.0,
          //                   ),
          //                   Text(
          //                     countryB
          //                         ? _selectedCountry!
          //                         .callingCode
          //                         .toString()
          //                         : "+1",
          //                     style:
          //                     CustomWidget(context: context)
          //                         .CustomTextStyle(
          //                         Theme.of(context).primaryColor,
          //                         FontWeight.normal,
          //                         'FontRegular'),
          //                   ),
          //                   const SizedBox(
          //                     width: 3.0,
          //                   ),
          //                   // const Icon(
          //                   //   Icons
          //                   //       .keyboard_arrow_down_outlined,
          //                   //   size: 15.0,
          //                   //   color: AppColors.blackColor,
          //                   // )
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 10.0,
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         child: Flexible(
          //           flex: 1,
          //           child: TextFormField(
          //             controller: mobileController,
          //             focusNode: mobileFocus,
          //             enabled: true,
          //             textInputAction: TextInputAction.next,
          //             keyboardType: TextInputType.number,
          //             style: CustomWidget(context: context)
          //                 .CustomSizedTextStyle(
          //                 16.0,
          //                 Theme.of(context).primaryColor,
          //                 FontWeight.w400,
          //                 'FontRegular'),
          //             decoration: InputDecoration(
          //               contentPadding: const EdgeInsets.only(
          //                   left: 12,
          //                   right: 0,
          //                   top: 2,
          //                   bottom: 2),
          //               hintText: "",
          //               border: InputBorder.none,
          //               enabledBorder: InputBorder.none,
          //               focusedBorder: InputBorder.none,
          //               errorBorder: InputBorder.none,
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),

          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 13.0, bottom: 13.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0),
                    color: CustomTheme.of(context)
                        .focusColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: _onPressedShowBottomSheet,
                        child: Row(
                          children: [
                            countryB
                                ? Image.asset(
                              _selectedCountry!.flag
                                  .toString(),
                              package:
                              "country_calling_code_picker",
                              height: 15.0,
                              width: 25.0,
                            )
                                : Container(
                              width: 0.0,
                            ),
                            Text(
                              countryB
                                  ? _selectedCountry!.callingCode.toString()
                                  : "+1",
                              style: CustomWidget(context: context)
                                  .CustomTextStyle(
                                  Theme.of(context).disabledColor,
                                  FontWeight.normal,
                                  'FontRegular'),
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            // Icon(
                            //   Icons.keyboard_arrow_down_outlined,
                            //   size: 15.0,
                            //   color: Theme.of(context).accentColor,
                            // )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )),
              Flexible(
                child: TextFormField(
                  controller: mobile,
                  focusNode: mobileFocus,
                  maxLines: 1,
                  enabled: mobileVerify,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: CustomWidget(context: context).CustomSizedTextStyle(
                      14.0,
                      Theme.of(context).primaryColor,
                      FontWeight.w500,
                      'FontRegular'),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 12, right: 0, top: 2, bottom: 2),
                    hintText: "9876543210",
                    hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0,
                        Theme.of(context).primaryColor.withOpacity(0.5),
                        FontWeight.w500,
                        'FontRegular'),
                    filled: true,
                    fillColor: Theme.of(context).errorColor.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                          color: CustomTheme.of(context)
                              .splashColor
                              .withOpacity(0.5),
                          width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                          color: CustomTheme.of(context)
                              .splashColor
                              .withOpacity(0.5),
                          width: 1.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                          color: CustomTheme.of(context)
                              .splashColor
                              .withOpacity(0.5),
                          width: 1.0),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30.0,),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            Forgot_Password()));
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
                        .text("loc_login_signin"),
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
          ),
          SizedBox(height: 25.0,),
        ],
      ),
    );
  }


  verifyMail() {
    apiUtils
        .doLoginEmail(
      nameController.text.toString(),
      passController.text.toString(),)
        .then((Login loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;
          });
          CustomWidget(context: context).
          custombar("Login", loginData.message.toString(), true);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  Home_Screen()));
          storeData(
              loginData.result!.token.toString(),
              loginData.result!.user!.id.toString(),
              loginData.result!.user!.email.toString(),
              loginData.result!.user!.role.toString(),
              loginData.result!.user!.name.toString());

          nameController.clear();
          passController.clear();

        } else {

          loading = false;
          CustomWidget(context: context)
              .custombar("Login", loginData.message.toString(), false);

        }
      });

    }).catchError((Object error) {


      print(error);
      setState(() {
        loading = false;
      });
    });
  }


  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheets(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  storeData(String token, String userId, String email,String role, String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
    preferences.setString("userId", userId);
    preferences.setString("email", email);
    preferences.setString("roleType", role);
    preferences.setString("name", name);
  }

}
