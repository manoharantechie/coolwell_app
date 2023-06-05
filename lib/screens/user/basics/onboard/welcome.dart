import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/custom_widget.dart';
import '../splash_home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController controller = PageController();
  int pageIndex = 0;

  Color yellow = const Color(0xFF1639FF);
  Color mediumYellow = const Color(0xFF1639FF);
  Color darkYellow = const Color(0xff606060);


  Color darkGrey = const Color(0xFF1639FF);

  storeData()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("first", "done");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
//      width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            PageView(
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: controller,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/images/wel1.png',
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        'Welcome!',
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            22.0,
                            Theme.of(context).cardColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Most affordable & trusted A/C service \nin your city ",
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            16.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/images/wel2.png',
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        'Select Your plans',
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            22.0,
                            Theme.of(context).cardColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Choose your Brand and select your \nservice based on your budget',
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            16.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/images/wel3.png',
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        'Get your precised bill',
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            22.0,
                            Theme.of(context).cardColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Get your true bill based on your service \nwithout any additional charges',
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            16.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/images/wel4.png',
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        'All set, Enjoy our service',
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            22.0,
                            Theme.of(context).cardColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'You are now ready to enjoy our services, \nHAVE A NICE EXPERIENCE',
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            16.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 16.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Opacity(
                          opacity: pageIndex != 3 ? 1.0 : 0.0,
                          child: MaterialButton(
                            splashColor: Colors.transparent,
                            child:  Text(
                              'Skip',
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).cardColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                            onPressed: () {
                              storeData();
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SplashHomeScreen()));

                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color:  pageIndex == 0 ? yellow : darkYellow, width: 2),
                                  color:
                                  pageIndex == 0 ? yellow : darkYellow),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color:  pageIndex == 1 ? yellow : darkYellow, width: 2),
                                  color:
                                  pageIndex == 1 ? yellow : darkYellow),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color:  pageIndex == 2 ? yellow : darkYellow, width: 2),
                                  color:
                                  pageIndex == 2 ? yellow : darkYellow),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color:   pageIndex == 3 ? yellow :darkYellow, width: 2),
                                  color:
                                  pageIndex == 3 ? yellow :darkYellow),
                            ),
                          ],
                        ),
                        pageIndex != 3
                            ? MaterialButton(
                          splashColor: Colors.transparent,
                          child:  Text(
                            'Next',
                            style:  CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).cardColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                          onPressed: () {
                            if (!(controller.page == 3.0)) {
                              controller.nextPage(
                                  duration:
                                  const Duration(milliseconds: 200),
                                  curve: Curves.linear);
                            }
                          },
                        )
                            : MaterialButton(
                          splashColor: Colors.transparent,
                          child:  Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0,top: 3.0, bottom: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(width: 1.0, color: Theme.of(context).cardColor,)
                            ),
                            child: Text(
                              'Start now',
                              style:  CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).cardColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ),
                          onPressed: () {
                            storeData();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SplashHomeScreen()));

                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
