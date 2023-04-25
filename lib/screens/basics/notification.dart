import 'package:coolwell_app/common/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/localization/localizations.dart';

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({Key? key}) : super(key: key);

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {

  ScrollController _scrollController = ScrollController();
  bool all = true;
  bool info = false;
  bool offer = false;
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
            const SizedBox(height: 50.0,),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0,bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(
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
                              .text("loc_notification"),
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
                  ), flex: 3,),
                  const SizedBox(width: 15.0,),
                  Flexible(child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          const Color(0xFF0DD8FF),
                          const Color(0xFF0FABFF),
                          const Color(0xFF1457FF).withOpacity(0.8),
                          const Color(0xFF1636FF),
                          const Color(0xFF0E69C7),
                        ],
                      ),
                    ),
                    child: Text(
                      AppLocalizations.instance.text("loc_chat"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).focusColor,
                          FontWeight.w500,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),
                  ),flex: 1,)
                ],
              ),
            ),
            const SizedBox(height: 5.0,),
            Container(
              height: 1.0,
              color: Theme.of(context).accentColor,
            ),
            const SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                children: [
                 InkWell(
                   onTap: (){
                     setState(() {
                       all = true;
                       info =false;
                       offer =false;
                     });
                   },
                   child:  Container(
                     padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
                     decoration: all?  BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                         color: Theme.of(context).cardColor.withOpacity(0.5),
                         border: Border.all(width: 1.0, color: Theme.of(context).cardColor,)
                     ) : BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                         color: Colors.transparent,
                         border: Border.all(width: 1.0, color: Theme.of(context).canvasColor,)
                     ),
                     child: Text(
                       AppLocalizations.instance.text("loc_all"),
                       style: CustomWidget(context: context)
                           .CustomSizedTextStyle(
                           14.0,
                           all ? Theme.of(context).primaryColor :Theme.of(context).canvasColor,
                           FontWeight.w500,
                           'FontRegular'),
                       textAlign: TextAlign.center,
                     ),
                   ),
                 ),
                  const SizedBox(width: 10.0,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        all = false;
                        info =true;
                        offer =false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      decoration: info? BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).cardColor.withOpacity(0.5),
                          border: Border.all(width: 1.0, color: Theme.of(context).cardColor,)
                      ) : BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.transparent,
                          border: Border.all(width: 1.0, color: Theme.of(context).canvasColor,)
                      ),
                      child: Text(
                        AppLocalizations.instance.text("loc_book_info"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            info? Theme.of(context).primaryColor :Theme.of(context).canvasColor,
                            FontWeight.w500,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        all = false;
                        info =false;
                        offer =true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      decoration: offer?  BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).cardColor.withOpacity(0.5),
                          border: Border.all(width: 1.0, color: Theme.of(context).cardColor,)
                      ) : BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.transparent,
                          border: Border.all(width: 1.0, color: Theme.of(context).canvasColor,)
                      ),
                      child: Text(
                        AppLocalizations.instance.text("loc_offers"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            offer? Theme.of(context).primaryColor :Theme.of(context).canvasColor,
                            FontWeight.w500,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              height: 1.0,
              color: Theme.of(context).accentColor,
            ),
            const SizedBox(height: 10.0,),

            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height *0.32,
                  child: Row(
                    children: [
                      Flexible(child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor.withOpacity(0.5),
                                      shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset("assets/images/tools.svg", height: 35.0, color: Theme.of(context).cardColor,),
                                ),flex: 1,),
                                const SizedBox(width: 15.0,),
                                Flexible(child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Clean AC Service",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            18.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(height: 10.0,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Flexible(child: Container(
                                            decoration: BoxDecoration(
                                                // color: Theme.of(context).accentColor.withOpacity(0.5),
                                                borderRadius: BorderRadius.circular(10.0)
                                            ),
                                            child: Image.asset("assets/images/notify_serv.png", height: 35.0,),
                                          ),flex: 1,),
                                          const SizedBox(width: 15.0,),
                                          Flexible(child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pre-service checks",
                                                  style: CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                      14.0,
                                                      Theme.of(context).primaryColor,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                                  textAlign: TextAlign.start,
                                                ),
                                                const SizedBox(height: 5.0,),
                                                Container(
                                                  child:  Text(
                                                    "Lorem ipsum dolor sit amet consectetur. Ac purus cum lectus odio turpis felis arcu non odio. Nunc vestibulum integer id convallis facilisi nulla sed nisl. Purus amet penatibus dui a a felis in in.",
                                                    style: CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context).primaryColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ), flex: 4,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),flex: 4,)
                              ],
                            ),
                            const SizedBox(height: 8.0,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.instance
                                          .text("loc_giv_rate"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          9.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 10.0,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(width: 1.0, color: Theme.of(context).accentColor.withOpacity(0.5),)
                                              ),
                                              child: SvgPicture.asset("assets/images/star.svg", height: 15.0,),
                                            ),
                                            const SizedBox(height: 5.0,),
                                            Text(
                                              "1",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  9.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),

                                        Flexible(child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(width: 1.0, color: Theme.of(context).accentColor.withOpacity(0.5),)
                                              ),
                                              child: SvgPicture.asset("assets/images/star.svg", height: 15.0,),
                                            ),
                                            const SizedBox(height: 5.0,),
                                            Text(
                                              "2",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  9.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),
                                        Flexible(child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(width: 1.0, color: Theme.of(context).accentColor.withOpacity(0.5),)
                                              ),
                                              child: SvgPicture.asset("assets/images/star.svg", height: 15.0,),
                                            ),
                                            const SizedBox(height: 5.0,),
                                            Text(
                                              "3",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  9.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),
                                        Flexible(child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(width: 1.0, color: Theme.of(context).cardColor,),
                                                color: Theme.of(context).cardColor,
                                              ),
                                              child: SvgPicture.asset("assets/images/star.svg", height: 15.0,color: Theme.of(context).focusColor),
                                            ),
                                            const SizedBox(height: 5.0,),
                                            Text(
                                              "4",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  9.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),
                                        Flexible(child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(width: 1.0, color: Theme.of(context).accentColor.withOpacity(0.5),)
                                              ),
                                              child: SvgPicture.asset("assets/images/star.svg", height: 15.0,),
                                            ),
                                            const SizedBox(height: 5.0,),
                                            Text(
                                              "5",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  9.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),
                                      ],
                                    )
                                  ],
                                ), flex: 1,),
                                Flexible(child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 25.0,),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.0),
                                            color: Colors.transparent,
                                            border: Border.all(width: 1.0, color: Theme.of(context).accentColor.withOpacity(0.2),)
                                        ),
                                        child: Text(
                                          AppLocalizations.instance.text("loc_share_feedback"),
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              9.0,
                                              Theme.of(context).accentColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_know_more"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            9.0,
                                            Theme.of(context).buttonColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),flex: 1,)
                              ],
                            )
                          ],
                        ),
                      ), flex: 5,),
                      Flexible(child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              const Color(0xFF0DD8FF),
                              const Color(0xFF0FABFF),
                              const Color(0xFF1457FF),
                              const Color(0xFF1636FF),
                              const Color(0xFF0E69C7),
                            ],
                          ),
                        ),
                      ), flex: 1,)
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 25.0, right: 10.0),
                    child: Image.asset("assets/images/cleaning.png", height: 100.0,),
                  ),
                )
              ],
            ),

            ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap:(){
                          viewDetails();
                          },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.instance.text("loc_booked_serv"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10.0)),
                                        child: Image.asset(
                                          "assets/images/cleaning.png",
                                          height: 80.0,
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.instance
                                                .text("loc_deep_clean"),
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context)
                                                    .primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .selectedRowColor,
                                                ),
                                                height: 5.0,
                                                width: 5.0,
                                              ),
                                              const SizedBox(
                                                width: 3.0,
                                              ),
                                              Text(
                                                "Service done on Feb 17",
                                                style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    10.0,
                                                    Theme.of(context)
                                                        .primaryColor,
                                                    FontWeight.w400,
                                                    'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15.0,
                                              color:
                                              Theme.of(context).primaryColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      flex: 3,
                                    ),
                                    // Flexible(child: Icon(
                                    //   Icons.
                                    // ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        color: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  viewDetails() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
        ),
        backgroundColor: Colors.transparent,
        enableDrag: true,
        context: context,
        builder: (BuildContext con) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter ssetState) {
                return Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: EdgeInsets.only(right: 15.0, left: 0.0,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height *0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/map.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
