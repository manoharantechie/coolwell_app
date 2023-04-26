import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/dotted_line_widget.dart';
import '../../common/localization/localizations.dart';
import '../user/basics/notification.dart';

class Tech_Order_Details_Screen extends StatefulWidget {
  const Tech_Order_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Tech_Order_Details_Screen> createState() => _Tech_Order_Details_ScreenState();
}

class _Tech_Order_Details_ScreenState extends State<Tech_Order_Details_Screen> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              const Color(0xFF0DD8FF).withOpacity(0.3),
              const Color(0xFF0FABFF).withOpacity(0.3),
              const Color(0xFF1457FF).withOpacity(0.3),
              const Color(0xFF1636FF).withOpacity(0.3),
              const Color(0xFF0E69C7).withOpacity(0.3),
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 20.0,),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.0),
                    color: Theme.of(context).focusColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height *0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22.0),
                              topRight: Radius.circular(22.0)
                          ),
                          color: Color(0xFF1F598E),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Color(0xFF1F598E).withOpacity(0.6),
                                BlendMode.dstATop),
                            image: AssetImage(
                                "assets/images/serv_back_2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 25.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          child: Text(
                                            AppLocalizations.instance
                                                .text("loc_cleaning"),
                                            style: CustomWidget(
                                                context:
                                                context)
                                                .CustomSizedTextStyle(
                                                18.0,
                                                Theme.of(
                                                    context)
                                                    .primaryColor,
                                                FontWeight
                                                    .w600,
                                                'FontRegular'),
                                            textAlign:
                                            TextAlign.start,
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "₹"+"4.99",
                                              style: CustomWidget(
                                                  context:
                                                  context)
                                                  .CustomSizedTextStyle(
                                                  13.0,
                                                  Theme.of(
                                                      context)
                                                      .primaryColor,
                                                  FontWeight
                                                      .w800,
                                                  'FontRegular'),
                                              textAlign:
                                              TextAlign
                                                  .center,
                                            ),
                                            SizedBox(
                                              width: 12.0,
                                            ),
                                            Container(
                                              width: 3.0,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Theme.of(
                                                    context)
                                                    .primaryColor,
                                              ),
                                            ),

                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              "Target time 45 mins",
                                              style: CustomWidget(
                                                  context:
                                                  context)
                                                  .CustomSizedTextStyle(
                                                  10.0,
                                                  Theme.of(
                                                      context)
                                                      .primaryColor,
                                                  FontWeight
                                                      .w400,
                                                  'FontRegular'),
                                              textAlign:
                                              TextAlign
                                                  .center,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                Flexible(
                                  child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10.0),
                                      image: DecorationImage(

                                        image: AssetImage(
                                          "assets/images/cleaning.png",),
                                        fit: BoxFit.cover,
                                      ),),
                                    width: 85.0,
                                    height: 80,
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            DottedLine(
                              direction: Axis.horizontal,
                              dashColor: Theme.of(context).accentColor,
                            ),
                            const SizedBox(height: 20.0,),
                            Text(
                              "User name",
                              style: CustomWidget(
                                  context:
                                  context)
                                  .CustomSizedTextStyle(
                                  18.0,
                                  Theme.of(
                                      context)
                                      .primaryColor,
                                  FontWeight
                                      .w700,
                                  'FontRegular'),
                              textAlign:
                              TextAlign.start,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                            ),
                            const SizedBox(height: 5.0,),
                            Text(
                              "User id",
                              style: CustomWidget(
                                  context:
                                  context)
                                  .CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(
                                      context)
                                      .primaryColor,
                                  FontWeight
                                      .w700,
                                  'FontRegular'),
                              textAlign:
                              TextAlign.start,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                            ),
                            const SizedBox(height: 20.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.instance
                                            .text("loc_serv_details"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            18.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.instance
                                            .text("loc_clean_foam"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            14.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Theme.of(context).selectedRowColor,
                                          ),
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.instance
                                            .text("loc_clean_power"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            14.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Theme.of(context).selectedRowColor,
                                          ),
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.instance
                                            .text("loc_indoor_outer"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            14.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                              "Intence",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  12.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.instance
                                            .text("loc_duration"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            14.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                              "45 mins",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  12.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "ACs serviced 5-12 months ago",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                              "",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  12.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 20.0,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            AppLocalizations.instance
                                                .text("loc_track_location"),
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                12.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                            textAlign: TextAlign.start,
                                          )

                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 20.0,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            "+91 9876543210",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                12.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                            textAlign: TextAlign.start,
                                          )

                                        ],
                                      )
                                    ],
                                  ),
                                ),flex: 1,),
                                Flexible(child: Container(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(
                                      "assets/tech/scan.svg",
                                      height: 80.0,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ), flex: 1,)

                              ],
                            ),
                            const SizedBox(height: 20.0,),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  setState(() {
                    showSuccessAlertDialog("Good luck! 🤗 ",
                        "You get your assigned task");
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  padding:
                  EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).buttonColor,
                  ),
                  child: Text(
                    AppLocalizations.instance
                        .text("loc_proceed_to_process"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        14.0,
                        Theme.of(context).focusColor,
                        FontWeight.w800,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
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
                borderRadius: BorderRadius.circular(14.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
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
                        fontSize: 17.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSansBold',
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7.0, bottom: 10.0),
                      height: 2.0,
                     color: Theme.of(context).dividerColor,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(true);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Notification_Screen()));
                        loading = true;
                      },
                      child: Text(
                        "Track process",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xFF007AFF),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7.0, bottom: 10.0),
                      height: 2.0,
                      color: Theme.of(context).dividerColor,
                    ),
                   InkWell(
                     onTap: (){

                     },
                     child:  Text(
                       "Track order location",
                       style: TextStyle(
                         fontSize: 17.0,
                         color: Color(0xFF007AFF),
                         fontWeight: FontWeight.w400,
                         fontFamily: 'OpenSans',
                       ),
                     ),
                   )
                  ],
                ),
              ),
            ),
          );
        });
    // show the dialog
  }

}
