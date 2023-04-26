
import 'package:coolwell_app/screens/user/basics/signUp.dart';
import 'package:coolwell_app/screens/user/payment/payment_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:coolwell_app/common/custom_button.dart';
import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'slot_screen.dart';
import 'edit_profile.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              const Color(0xFF1636FF).withOpacity(0.3),
              const Color(0xFF0FABFF).withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFFF4F4F4).withOpacity(0.5),
                          const Color(0xFFF4F4F4).withOpacity(0.3),
                          const Color(0xFFF4F4F4).withOpacity(0.1),
                        ],
                      ),
                    ),
                    child:  Text(
                      AppLocalizations.instance
                          .text("loc_profile"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          18.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w400,
                          'FontRegular'),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).focusColor,
                            image: DecorationImage(
                              image: AssetImage("assets/images/profile.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child:  InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            Edit_Profile_Screen()));
                                  },
                                  child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:  Theme.of(context).cardColor,
                                  ),
                                  child: SvgPicture.asset("assets/images/edit.svg",),
                                ),),
                              )

                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mr,",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "Username",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    18.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w700,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "example@gmail.com",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "+91 9876543210",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),flex: 3,),
            const SizedBox(height: 15.0,),
            Flexible(child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0,),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            const Color(0xFFFFFFFF).withOpacity(0.8),
                            const Color(0xFFFFFFFF).withOpacity(0.5),
                            const Color(0xFF1636FF).withOpacity(0.3),
                            const Color(0xFF0FABFF).withOpacity(0.3),

                          ],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: SvgPicture.asset("assets/profile/booking.svg", height: 20.0, color: Theme.of(context).primaryColor,),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: Text(
                            // AppLocalizations.instance
                            //     .text("loc_booking"),
                              AppLocalizations.instance
                                  .text("loc_side_service"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                16.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ),flex: 4,)

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Slot_Screen()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerRight,
                        //   end: Alignment.centerLeft,
                        //   colors: [
                        //     const Color(0xFFFFFFFF),
                        //     const Color(0xFFFFFFFF).withOpacity(0.2),
                        //     const Color(0xFF1636FF).withOpacity(0.3),
                        //     const Color(0xFF0FABFF).withOpacity(0.3),
                        //
                        //   ],
                        // ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: SvgPicture.asset("assets/profile/address.svg", height: 20.0, color: Theme.of(context).primaryColor,),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: Text(
                            AppLocalizations.instance
                                .text("loc_your_add"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                16.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ), flex: 4,),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Payment_Summary_Screen()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerRight,
                        //   end: Alignment.centerLeft,
                        //   colors: [
                        //     const Color(0xFFFFFFFF),
                        //     const Color(0xFFFFFFFF).withOpacity(0.2),
                        //     const Color(0xFF1636FF).withOpacity(0.3),
                        //     const Color(0xFF0FABFF).withOpacity(0.3),
                        //
                        //   ],
                        // ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: SvgPicture.asset("assets/profile/wallet.svg", height: 20.0, color: Theme.of(context).primaryColor,),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: Text(
                            AppLocalizations.instance
                                .text("loc_pay_method"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                16.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ), flex: 4,),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    height: 1.0,color: Theme.of(context).accentColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 10.0,),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerRight,
                        //   end: Alignment.centerLeft,
                        //   colors: [
                        //     const Color(0xFFFFFFFF),
                        //     const Color(0xFFFFFFFF).withOpacity(0.2),
                        //     const Color(0xFF1636FF).withOpacity(0.3),
                        //     const Color(0xFF0FABFF).withOpacity(0.3),
                        //
                        //   ],
                        // ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: SvgPicture.asset("assets/profile/history.svg", height: 20.0, color: Theme.of(context).primaryColor,),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: Text(
                            AppLocalizations.instance
                                .text("loc_serv_his"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                16.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ), flex: 4,),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerRight,
                        //   end: Alignment.centerLeft,
                        //   colors: [
                        //     const Color(0xFFFFFFFF),
                        //     const Color(0xFFFFFFFF).withOpacity(0.2),
                        //     const Color(0xFF1636FF).withOpacity(0.3),
                        //     const Color(0xFF0FABFF).withOpacity(0.3),
                        //
                        //   ],
                        // ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Flexible(child:
                          // SvgPicture.asset("assets/tech/notify.svg", height: 18.0, color: Theme.of(context).primaryColor,),flex: 1,),
                          // const SizedBox(width: 15.0,),
                          // Flexible(child: Text(
                          //   AppLocalizations.instance
                          //       .text("loc_notification"),
                          //   style: CustomWidget(context: context)
                          //       .CustomSizedTextStyle(
                          //       16.0,
                          //       Theme.of(context).primaryColor,
                          //       FontWeight.w500,
                          //       'FontRegular'),
                          //   textAlign: TextAlign.center,
                          // ), flex: 4,),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    height: 1.0,color: Theme.of(context).accentColor.withOpacity(0.5),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerRight,
                        //   end: Alignment.centerLeft,
                        //   colors: [
                        //     const Color(0xFFFFFFFF),
                        //     const Color(0xFFFFFFFF).withOpacity(0.2),
                        //     const Color(0xFF1636FF).withOpacity(0.3),
                        //     const Color(0xFF0FABFF).withOpacity(0.3),
                        //
                        //   ],
                        // ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: SvgPicture.asset("assets/profile/help.svg", height: 20.0, color: Theme.of(context).primaryColor,),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: Text(
                            AppLocalizations.instance
                                .text("loc_help_feed"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                16.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ), flex: 4,),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        showSuccessAlertDialog("Logout",
                            "Are you sure want to logout ?");
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerRight,
                        //   end: Alignment.centerLeft,
                        //   colors: [
                        //     const Color(0xFFFFFFFF),
                        //     const Color(0xFFFFFFFF).withOpacity(0.2),
                        //     const Color(0xFF1636FF).withOpacity(0.3),
                        //     const Color(0xFF0FABFF).withOpacity(0.3),
                        //
                        //   ],
                        // ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: SvgPicture.asset("assets/profile/help.svg", height: 20.0, color: Theme.of(context).primaryColor,),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: Text(
                            AppLocalizations.instance
                                .text("loc_logout"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                16.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ), flex: 4,),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),


                ],
              ),

            ),flex: 7,)
          ],
        ),
      ),
    );
  }

  showSuccessAlertDialog(
      String title,
      String message,
      ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
               color: Theme.of(context).focusColor,
              ),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSansBold',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7.0, bottom: 10.0),
                      height: 2.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            const Color(0xFF0DD8FF).withOpacity(0.3),
                            const Color(0xFF0FABFF).withOpacity(0.3),
                            const Color(0xFF1457FF).withOpacity(0.3),
                            const Color(0xFF1636FF).withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.clear();
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                SignUp_Screen()), (Route<dynamic> route) => false);
                            loading = true;
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  const Color(0xFF0DD8FF),
                                  const Color(0xFF0FABFF),
                                  const Color(0xFF1457FF),
                                  const Color(0xFF1636FF),
                                ],
                              ),
                            ),
                            child: Text(
                              AppLocalizations.instance
                                  .text("loc_logout"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  16.0,
                                  Theme.of(context).focusColor,
                                  FontWeight.w700,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  const Color(0xFF0DD8FF),
                                  const Color(0xFF0FABFF),
                                  const Color(0xFF1457FF),
                                  const Color(0xFF1636FF),
                                ],
                              ),
                            ),
                            child: Text(
                              AppLocalizations.instance
                                  .text("loc_cancel"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  16.0,
                                  Theme.of(context).focusColor,
                                  FontWeight.w700,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
    // show the dialog
  }
}
