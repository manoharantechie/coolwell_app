import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coolwell_app/screens/basics/signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/model/api_utils.dart';
import '../../common/model/register.dart';
import '../../common/text_field_custom_prefix.dart';

class SignIn_Screen extends StatefulWidget {
  const SignIn_Screen({Key? key}) : super(key: key);

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset("assets/images/back.png", fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),

            contentUI(),
            loading
                ? CustomWidget(context: context).loadingIndicator(
              Theme.of(context).primaryColor,
            )
                : Container()

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
                  TextFormCustom(
                    onEditComplete: () {
                      phoneNumFocus.unfocus();
                      FocusScope.of(context).requestFocus(emailFocus);
                    },
                    radius: 6.0,
                    error: "Enter Phone Number",
                    textColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).dividerColor,
                    fillColor: Theme.of(context).focusColor,
                    hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                    textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
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
                      if(phoneNumController.text.isEmpty) {
                        return "Please Enter Phone Number";
                      }
                      // else if(!RegExp("/^[a-zA-Z0-9!@#\$%\^\&*\)\(+=._-]{10,}$/g")
                      //     .hasMatch(phoneNumController.text)) {
                      //   return "Please Enter Valid Phone Number";
                      // }
                      else if(phoneNumController.text.length<10) {
                        return "Please Enter Valid Phone Number ";
                      } else if(phoneNumController.text.length>10) {
                        return "Please Enter Valid Phone Number";
                      }
                    },
                    enabled: true,
                    textInputType: TextInputType.phone,
                    controller: phoneNumController,
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
                      } else if( passController.text.length< 8 ) {
                        return "Please enter must not be less than 8 character";
                      } else if(passController.text.length> 14){
                        return "Please enter must not be greater than 14 character";
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
                              Expanded(child: Padding(padding: EdgeInsets.only(top: 10.0),child: Text(
                                "Lorem ipsum dolor sit amet conse ctetur Lorem ipsum dolor sit amet",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).canvasColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                                textAlign: TextAlign.start,
                              ),),)
                            ],
                          ),
                          SizedBox(height: 25.0,),
                          InkWell(
                            onTap: (){
                              // if (emailformKey.currentState!.validate()) {
                              //   setState(() {
                              //     loading = true;
                              //     RegisterEmail();
                              //   });
                              // }
                              //
                              // setState(() {
                              //
                              //   FocusScope.of(context).unfocus();
                              //   if (nameController.text.isEmpty) {
                              //     CustomWidget(context: context)
                              //         .custombar("Register", "Please Enter UserName", false);
                              //   } else if( nameController.text.length< 2 ) {
                              //     CustomWidget(context: context).custombar("Register", "Please Enter Minimum 2 Letters Name",
                              //         false);
                              //   } else if(phoneNumController.text.isEmpty) {
                              //     CustomWidget(context: context).custombar("Register", "Please Enter Phone Number ",
                              //         false);
                              //   } else if(phoneNumController.text.length<10) {
                              //     CustomWidget(context: context).custombar("Register", "Please Enter Valid Phone Number ",
                              //         false);
                              //   } else if(phoneNumController.text.length>10) {
                              //     CustomWidget(context: context).custombar("Register", "Please Enter Valid Phone Number ",
                              //         false);
                              //   } else if(emailController.text.isEmpty) {
                              //     CustomWidget(context: context).custombar("Register", "Please Enter Email Details",
                              //         false);
                              //   } else if(!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              //       .hasMatch(emailController.text)) {
                              //     CustomWidget(context: context).custombar("Register", "Please enter valid email format",
                              //         false);
                              //   } else if(passController.text.isEmpty) {
                              //     CustomWidget(context: context).custombar("Register", "Please Enter Password ",
                              //         false);
                              //   } else if( passController.text.length< 8 ) {
                              //     CustomWidget(context: context).custombar("Register", "Please Enter Valid Password ",
                              //         false);
                              //   } else {
                              //     print("print");
                              //     setState(() {
                              //       loading = true;
                              //       RegisterEmail();
                              //     });
                              //   }
                              // });
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
                                      .text("loc_signin"),
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
    );
}

  RegisterEmail() {
    apiUtils
        .doRegisterEmail(
      nameController.text.toString(),
      phoneNumController.text.toString(),
      emailController.text.toString(),
      passController.text.toString())
        .then((Register loginData) {
      if (loginData.success!) {
        setState(() {
          loading = false;
        });
        custombar("Register", loginData.message.toString(), true);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SignUp_Screen()));

        nameController.clear();
        emailController.clear();
        phoneNumController.clear();
        passController.clear();

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
