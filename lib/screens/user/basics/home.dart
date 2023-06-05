import 'dart:io';

import 'package:coolwell_app/common/bottom_nav.dart';
import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:coolwell_app/common/theme/custom_theme.dart';
import 'package:coolwell_app/screens/user/profile/profile.dart';
import 'package:coolwell_app/screens/user/service/history.dart';
import 'package:coolwell_app/screens/user/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'dashboard.dart';

class Home_Screen extends StatefulWidget {

  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  final PageStorageBucket bucket = PageStorageBucket();
  List<BottomNavItem>? _bottomItems;
  int currentIndex=0;
  int selectIndex=0;
  List<Widget>  bottomPage = [
    DashBoard_Screen(),
    Service_Screen(),
    Service_history(),
    Profile_Screen()
  ];

  Widget screen = DashBoard_Screen();

  void onSelectItem(int index) async {
    setState(() {
      selectIndex=index;
      currentIndex = index;
      screen = bottomPage[index];

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomItems = createBottomItems();
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body:  PageStorage(child:  screen, bucket: bucket),

          bottomNavigationBar: bottomBar(),
    ), onWillPop: () async {
      if (currentIndex != 0) {
        setState(() {
          currentIndex = 0;
          // dashView = true;

          //currentScreen = screens[currentTab];
        });
        return false;
      } else {
        exit(0);
      }
      return true;
    },);
  }


  Widget bottomBar() {
    return Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        color: CustomTheme.of(context).focusColor,
        padding: EdgeInsets.only(left: 10.0,right: 10.0),
        child: Stack(
          children: [
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).focusColor,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                        onSelectItem(0);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/menu/cool.svg',
                            color: currentIndex == 0
                                ? Theme.of(context).cardColor
                                : Theme.of(context)
                                .primaryColor),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text( AppLocalizations.instance.text('loc_side_cool'),
                            textAlign: TextAlign.center,
                            style: CustomWidget(context: context)
                                .CustomTextStyle(
                                currentIndex == 0
                                    ? Theme.of(context).cardColor
                                : Theme.of(context)
                            .primaryColor,
                                FontWeight.normal,
                                'FontRegular')),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;

                        onSelectItem(1);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/menu/service.svg',
                            color: currentIndex == 1
                                ? Theme.of(context).cardColor
                                : Theme.of(context)
                                .primaryColor),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            AppLocalizations.instance.text('loc_side_service'),
                            textAlign: TextAlign.center,
                            style: CustomWidget(context: context)
                                .CustomTextStyle(
                                currentIndex == 1
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context)
                                    .primaryColor,
                                FontWeight.normal,
                                'FontRegular')
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                        onSelectItem(2);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/menu/history.svg',
                            color: currentIndex == 2
                                ? Theme.of(context).cardColor
                                : Theme.of(context)
                                .primaryColor),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          AppLocalizations.instance.text('loc_side_history'),
                          textAlign: TextAlign.center,
                          style: CustomWidget(context: context)
                              .CustomTextStyle(
                              currentIndex == 2
                                  ? Theme.of(context).cardColor
                                  : Theme.of(context)
                                  .primaryColor,
                              FontWeight.normal,
                              'FontRegular'

                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                        onSelectItem(3);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/menu/account.svg',
                            color: currentIndex == 3
                                ? Theme.of(context).cardColor
                                : Theme.of(context)
                                .primaryColor,),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          AppLocalizations.instance.text('loc_side_account'),
                          textAlign: TextAlign.center,
                          style: CustomWidget(context: context)
                              .CustomTextStyle(
                              currentIndex == 3
                                  ? Theme.of(context).cardColor
                                  : Theme.of(context)
                                  .primaryColor,
                              FontWeight.normal,
                              'FontRegular'

                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ));
  }

  List<BottomNavItem> createBottomItems() {
    final bottomItems = [
      new BottomNavItem("assets/menu/cool.svg", label: "loc_side_cool"),
      new BottomNavItem("assets/menu/service.svg", label: "loc_side_service"),
      new BottomNavItem("assets/menu/history.svg", label: "loc_side_history"),
      new BottomNavItem("assets/menu/account.svg", label: "loc_side_account")
    ];
    return bottomItems;
  }
}
