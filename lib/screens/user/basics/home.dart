import 'dart:io';

import 'package:coolwell_app/common/bottom_nav.dart';
import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/screens/user/profile/profile.dart';
import 'package:coolwell_app/screens/user/service/history.dart';
import 'package:coolwell_app/screens/user/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../technician/tech_dashboard.dart';
import '../../technician/tech_orders.dart';
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
        bottomNavigationBar: BottomNav(
          index: currentIndex,
          selectedIndex: selectIndex,
          color: Theme.of(context).cardColor,
          iconStyle: IconStyle(
            color: Theme.of(context).cardColor,
            onSelectColor: Theme.of(context).cardColor,
            size: 20.0,
          ),
          bgStyle: BgStyle(
            color: Theme.of(context).focusColor,
            onSelectColor: Theme.of(context).focusColor,
          ),
          labelStyle: LabelStyle(
            visible: true,
            textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                10.0,
                Theme.of(context).primaryColor,
                FontWeight.w600,
                'FontRegular'),
            onSelectTextStyle: CustomWidget(context: context).CustomSizedTextStyle(
                10.0,
                Theme.of(context).cardColor,
                FontWeight.w600,
                'FontRegular'),
          ),
          onTap: (i) {
            setState(() {
              onSelectItem(i);
              currentIndex=i;

            });
          },
          items: _bottomItems,
        )
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
