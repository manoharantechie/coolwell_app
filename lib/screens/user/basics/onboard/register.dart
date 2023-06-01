import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coolwell_app/common/text_field_custom_prefix.dart';
import 'package:coolwell_app/screens/user/basics/onboard/verify_email.dart';
import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';

import '../../../../common/country.dart';
import '../../../../common/theme/custom_theme.dart';
import '../../../../data/api_utils.dart';
import '../../../../data/model/register.dart';

class SignIn_Screen extends StatefulWidget {
  const SignIn_Screen({Key? key}) : super(key: key);

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {

  Country? _selectedCountry;
  bool countryB = false;
  FocusNode mobileFocus = FocusNode();
  bool mobileVerify = true;
  TextEditingController mobile = TextEditingController();

  APIUtils apiUtils = APIUtils();
  bool loading = false;
  var snackBar;
  bool passVisible = false;
  bool checkHide=false;
  FocusNode nameFocus = FocusNode();
  FocusNode phoneNumFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final emailformKey = GlobalKey<FormState>();

  custombar(String title, String message, bool status) {
    snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: status ? ContentType.success : ContentType.failure,
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child:  Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(
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
                              .text("loc_create_acc"),
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
                            FocusScope.of(context).requestFocus(phoneNumFocus);
                          },
                          radius: 6.0,
                          error: "Enter Full Name",
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
                          hintText: "Full Name",
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
                            if (nameController.text.isEmpty) {
                              return "Please Enter UserName";
                            } else if( nameController.text.length< 2 ) {
                              return "Please Enter Minimum 2 Letters Name";
                            }
                          },
                          enabled: true,
                          textInputType: TextInputType.name,
                          controller: nameController,
                        ),
                        SizedBox(height: 15.0,),
                        // TextFormCustom(
                        //   onEditComplete: () {
                        //     phoneNumFocus.unfocus();
                        //     FocusScope.of(context).requestFocus(emailFocus);
                        //   },
                        //   radius: 6.0,
                        //   error: "Enter Phone Number",
                        //   textColor: Theme.of(context).primaryColor,
                        //   borderColor: Theme.of(context).dividerColor,
                        //   fillColor: Theme.of(context).focusColor,
                        //   hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        //       14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                        //   textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        //       14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                        //   textInputAction: TextInputAction.next,
                        //   focusNode: phoneNumFocus,
                        //   maxlines: 1,
                        //   text: '',
                        //   hintText: "Phone Number",
                        //   obscureText: false,
                        //   textChanged: (value) {},
                        //   onChanged: () {},
                        //   suffix: Container(
                        //     width: 0.0,
                        //   ),
                        //   prefix: Container(
                        //     child: Icon(
                        //       Icons.phone,
                        //       color: Theme.of(context).primaryColor.withOpacity(0.3),
                        //     ),
                        //   ),
                        //   validator: (value) {
                        //     if(phoneNumController.text.isEmpty) {
                        //       return "Please Enter Phone Number";
                        //     }
                        //     // else if(!RegExp("/^[a-zA-Z0-9!@#\$%\^\&*\)\(+=._-]{10,}$/g")
                        //     //     .hasMatch(phoneNumController.text)) {
                        //     //   return "Please Enter Valid Phone Number";
                        //     // }
                        //     else if(phoneNumController.text.length<10) {
                        //       return "Please Enter Valid Phone Number ";
                        //     } else if(phoneNumController.text.length>10) {
                        //       return "Please Enter Valid Phone Number";
                        //     }
                        //   },
                        //   enabled: true,
                        //   textInputType: TextInputType.phone,
                        //   controller: phoneNumController,
                        // ),

                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 13.0, bottom: 14.0),
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
                                      onTap: (){
                                        setState(() {
                                          _onPressedShowBottomSheet();
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          countryB
                                              ? Image.asset(
                                            _selectedCountry!.flag.toString(),
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
                                                countryB
                                                    ? Theme.of(context).primaryColor: Theme.of(context).primaryColor.withOpacity(0.3),
                                                FontWeight.normal,
                                                'FontRegular'),
                                          ),
                                          const SizedBox(
                                            width: 3.0,
                                          ),
                                          // Icon(
                                          //   Icons.keyboard_arrow_down_outlined,
                                          //   size: 15.0,
                                          //   color: Theme.of(context).dialogBackgroundColor,
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
                                  hintText: "Mobile number",
                                  hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                      14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                                  filled: true,
                                  fillColor: Theme.of(context).focusColor,
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

                        SizedBox(height: 15.0,),
                        TextFormCustom(
                          onEditComplete: () {
                            emailFocus.unfocus();
                            FocusScope.of(context).requestFocus(passFocus);
                          },
                          radius: 6.0,
                          error: "Enter Email",
                          textColor: Theme.of(context).primaryColor,
                          borderColor: Theme.of(context).dividerColor,
                          fillColor: Theme.of(context).focusColor,
                          hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                          textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
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
                            if(emailController.text.isEmpty) {
                              return "Please Enter Email Details";
                            } else if(!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailController.text)) {
                              return "Please enter valid email format";
                            }
                          },
                          enabled: true,
                          textInputType: TextInputType.emailAddress,
                          controller: emailController,
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
                            } else if( passController.text.length< 6 ) {
                              return "Please enter must not be less than 8 character";
                            }
                          },
                          enabled: true,
                          textInputType: TextInputType.text,
                          controller: passController,
                        ),
                        SizedBox(height: 15.0,),

                        Align(
                            alignment: Alignment.center,
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                        data: ThemeData(
                                          primarySwatch: Colors.cyan,
                                          unselectedWidgetColor: Colors.grey, // Your color
                                        ),
                                        child: Checkbox(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          value: checkHide,
                                          checkColor:   Theme.of(context).focusColor,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              checkHide = value!;
                                            });
                                          },
                                        )),
                                  Expanded(child:   Padding(
                                    padding:
                                    EdgeInsets.only( top: 7.0),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Accept and Continue ',
                                        style: TextStyle(
                                          color: Theme.of(context).splashColor,
                                        ),
                                        children: <TextSpan>[

                                          TextSpan(
                                            text: AppLocalizations.instance
                                                .text("loc_terms_txt"),
                                            recognizer: TapGestureRecognizer()..onTap = () {

                                            },
                                            style: TextStyle(
                                                color: Theme.of(context).secondaryHeaderColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                                  ],
                                ),
                                SizedBox(height: 25.0,),
                                InkWell(
                                  onTap: (){

                                    if(checkHide)
                                      {
                                        if (emailformKey.currentState!.validate()) {
                                          setState(() {
                                            loading = true;
                                            RegisterEmail();
                                          });
                                        }

                                      }
                                    else
                                      {
                                        custombar("Coolwell", "Accept terms and Conditions", false);
                                      }

                                    //

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
                                      color: Theme.of(context).shadowColor,
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
                        )


                      ],
                    ),
                    key: emailformKey,
                  ),
                ),flex: 3,),
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
          )
      ),
    );
}

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheets(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
        countryB=true;
      });
    }
  }

  RegisterEmail() {
    apiUtils
        .doRegisterEmail(
      nameController.text.toString(),_selectedCountry!.callingCode.toString()+
        mobile.text.toString(),
      emailController.text.toString(),
      passController.text.toString())
        .then((CommonModel loginData) {
      if (loginData.success!) {
        setState(() {
          loading = false;
        });
        custombar("Register", loginData.message.toString(), true);

        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    EmailViaScreen(type: "verify",mail: emailController.text.toString(),)));


      } else {
        setState(() {
          loading = false;
          custombar("Register", loginData.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      print(error);
      setState(() {
        loading = false;
      });
    });
  }

}
