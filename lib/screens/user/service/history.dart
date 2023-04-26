import 'package:coolwell_app/common/dotted_line_widget.dart';
import 'package:coolwell_app/common/theme/custom_theme.dart';
import 'package:coolwell_app/common/ticket_design.dart';
import 'package:coolwell_app/screens/user/service/history_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';

class Service_history extends StatefulWidget {
  const Service_history({Key? key}) : super(key: key);

  @override
  State<Service_history> createState() => _Service_historyState();
}

class _Service_historyState extends State<Service_history> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 30.0),
        color: Theme.of(context).focusColor,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            const Color(0xFFF4F4F4),
                            const Color(0xFFF4F4F4).withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: Text(
                        AppLocalizations.instance.text("loc_serv_his"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                                18.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w400,
                                'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    flex: 3,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: Container(
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
                        AppLocalizations.instance.text("loc_help"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).focusColor,
                                FontWeight.w500,
                                'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 20.0,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                CustomTheme.of(context)
                                    .cardColor
                                    .withOpacity(0.1),
                                CustomTheme.of(context)
                                    .buttonColor
                                    .withOpacity(0.1)
                              ],
                              begin: Alignment.topRight,
                              //const FractionalOffset(0.0, 0.5),
                              end: Alignment.bottomLeft,
                              //const FractionalOffset(1.0, 0.6),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Service_History_Details()));

                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 0.0,
                                bottom: 20.0),
                            child: TicketWidget(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 5.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFF1F598E),
                                    image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Color(0xFF1F598E).withOpacity(0.6),
                                          BlendMode.dstATop),
                                      image: AssetImage(
                                          "assets/images/serv_back_2.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: SvgPicture.asset(
                                        "assets/menu/cool.svg",
                                        height: 25.0,
                                        color: Theme.of(context).cardColor,
                                      ),
                                    ),
                                    DottedLine(
                                      direction: Axis.vertical,
                                      dashColor: Theme.of(context).dividerColor,
                                    ),
                                    Flexible(
                                        child: Container(
                                      padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    // width: MediaQuery.of(context).size.width * 0.2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            // AppLocalizations.instance
                                                            //     .text("loc_cleaning"),
                                                            "Deep clean AC Service ",
                                                            style: CustomWidget(
                                                                    context:
                                                                        context)
                                                                .CustomSizedTextStyle(
                                                                    18.0,
                                                                    Theme.of(
                                                                            context)
                                                                        .focusColor,
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
                                                          height: 5.0,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              size: 15.0,
                                                              color: Theme.of(
                                                                      context)
                                                                  .cardColor,
                                                            ),
                                                            SizedBox(
                                                              width: 5.0,
                                                            ),
                                                            Text(
                                                              "4.81 (1.2M)",
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      10.0,
                                                                      Theme.of(
                                                                              context)
                                                                          .focusColor,
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
                                                          height: 5.0,
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
                                                              "₹499",
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      13.0,
                                                                      Theme.of(
                                                                              context)
                                                                          .focusColor,
                                                                      FontWeight
                                                                          .w800,
                                                                      'FontRegular'),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            SizedBox(
                                                              width: 10.0,
                                                            ),
                                                            Container(
                                                              width: 1.0,
                                                              height: 13.0,
                                                              color: Theme.of(
                                                                      context)
                                                                  .dividerColor,
                                                            ),
                                                            SizedBox(
                                                              width: 10.0,
                                                            ),
                                                            Text(
                                                              "₹649",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .accentColor,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            SizedBox(
                                                              width: 20.0,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .focusColor,
                                                                  ),
                                                                  width: 2.0,
                                                                  height: 2.0,
                                                                ),
                                                                SizedBox(
                                                                  width: 5.0,
                                                                ),
                                                                Text(
                                                                  "45 mins",
                                                                  style: CustomWidget(context: context).CustomSizedTextStyle(
                                                                      10.0,
                                                                      Theme.of(
                                                                              context)
                                                                          .focusColor,
                                                                      FontWeight
                                                                          .w400,
                                                                      'FontRegular'),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            )
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
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              height: MediaQuery.of(context).size.height * 0.26,
                              width: MediaQuery.of(context).size.width,
                              isCornerRounded: true,
                            ),
                          )),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
