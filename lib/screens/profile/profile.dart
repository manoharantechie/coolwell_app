import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import 'edit_profile.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 30.0),
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
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            // Navigator.pop(context);
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
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        Text(
                          AppLocalizations.instance
                              .text("loc_profile"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              18.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w400,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
                            AppLocalizations.instance
                                .text("loc_booking"),
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
                          // SvgPicture.asset("assets/profile/history.svg", height: 18.0, color: Theme.of(context).primaryColor,),flex: 1,),
                          // const SizedBox(width: 15.0,),
                          // Flexible(child: Text(
                          //   AppLocalizations.instance
                          //       .text("loc_serv_his"),
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
}
