import 'package:coolwell_app/screens/basics/signUp.dart';
import 'package:coolwell_app/screens/basics/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class SplashHomeScreen extends StatefulWidget {
  const SplashHomeScreen({Key? key}) : super(key: key);

  @override
  State<SplashHomeScreen> createState() => _SplashHomeScreenState();
}

class _SplashHomeScreenState extends State<SplashHomeScreen> {


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
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.instance
                        .text("loc_welcome"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        28.0,
                        Theme.of(context).focusColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  SizedBox(height: 50.0,),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignIn_Screen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(colors: [const Color(0xFF1636FF),
                        //   const Color(0xFF0FABFF),],
                        //   begin: const FractionalOffset(0.0, 0.0),
                        //   end: const FractionalOffset(1.0, 0.0),),
                        border: Border.all(
                          width: 1.0,
                          color: Theme.of(context).cardColor,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent,
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
                  SizedBox(height: 15.0,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUp_Screen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      decoration: BoxDecoration(
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
                  SizedBox(height: 40.0,),
                  Text(
                    AppLocalizations.instance
                        .text("loc_social_txt"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        14.0,
                        Theme.of(context).focusColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  SizedBox(height: 35.0,),
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



                ],
              ),
            ),flex: 3,),

            Flexible(child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 1.0,
                    color: Theme.of(context).dividerColor,
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    height: 20.0,
                  ),
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
            ),flex: 2,)

          ],
        ),
      ),
    );
  }

}
