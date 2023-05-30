import 'package:coolwell_app/screens/user/basics/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/custom_widget.dart';
import '../../../common/dotted_line_widget.dart';
import '../../../common/localization/localizations.dart';
import '../../../common/ticket_design.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final String s_Name;
  final String s_Date;
  final String s_add;
  final String s_Time;
  final String s_amt;
  const PaymentSuccessScreen({Key? key,  required this.s_Name,required this.s_Date,required this.s_add,required this.s_Time,required this.s_amt,}) : super(key: key);

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {

  String name="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print(widget.s_Date);
    String s = widget.s_Date;
    int idx = s.indexOf("/");
    List parts = [s.substring(2,idx).trim(), s.substring(idx+1).trim()];
    print(parts);
  }

  getData()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              const Color(0xFF0DD8FF).withOpacity(0.8),
              const Color(0xFF0FABFF).withOpacity(0.8),
              const Color(0xFF1457FF).withOpacity(0.8),
              const Color(0xFF1636FF).withOpacity(0.8),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).selectedRowColor,
              ),
              child: Icon(
                Icons.check,
                color: Theme.of(context).focusColor,
                size: 80.0,
              ),
            ),
            const SizedBox(height: 15.0,),
            Text(
              "Payment of ₹"+widget.s_amt.toString()+" successfuly",
              style: CustomWidget(context: context)
                  .CustomSizedTextStyle(
                  18.0,
                  Theme.of(context).focusColor,
                  FontWeight.w600,
                  'FontRegular'),
            ),
            const SizedBox(height: 25.0,),
            Container(
              padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 0.0,
                  bottom: 20.0),
              child: TicketWidget(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height:
                  MediaQuery.of(context).size.height *
                      0.25,
                  padding: EdgeInsets.fromLTRB(
                      10.0, 15.0, 10.0, 5.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF1F598E),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Color(0xFF1F598E)
                                .withOpacity(0.6),
                            BlendMode.dstATop),
                        image: AssetImage(
                            "assets/images/serv_back_2.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                      BorderRadius.circular(15.0)),
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 10.0,
                        ),
                        child: SvgPicture.asset(
                          "assets/menu/cool.svg",
                          height: 25.0,
                          color:
                          Theme.of(context).cardColor,
                        ),
                      ),
                      DottedLine(
                        direction: Axis.vertical,
                        dashColor:
                        Theme.of(context).dividerColor,
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
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width* 0.5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              name.toString(),
                                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                                  18.0,
                                                  Theme.of(
                                                      context)
                                                      .focusColor,
                                                  FontWeight
                                                      .w600,
                                                  'FontRegular'),
                                              textAlign:
                                              TextAlign
                                                  .start,
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              widget.s_Name.toString(),
                                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                                  12.0,
                                                  Theme.of(
                                                      context)
                                                      .focusColor,
                                                  FontWeight
                                                      .w600,
                                                  'FontRegular'),
                                              textAlign:
                                              TextAlign
                                                  .start,
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                            )
                                          ],
                                        ),
                                      ),
                                     const SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width *0.5,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: 15.0,
                                                    color: Theme.of(
                                                        context)
                                                        .focusColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),
                                                 Flexible(
                                                   child:  Text(
                                                     widget.s_add,
                                                     style: CustomWidget(context: context).CustomSizedTextStyle(
                                                         8.0,
                                                         Theme.of(context)
                                                             .focusColor,
                                                         FontWeight
                                                             .w600,
                                                         'FontRegular'),
                                                     textAlign:
                                                     TextAlign
                                                         .start,
                                                     overflow: TextOverflow.ellipsis,
                                                   ),
                                                 )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    size: 15.0,
                                                    color: Theme.of(
                                                        context)
                                                        .focusColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    widget.s_Time,
                                                    style: CustomWidget(context: context).CustomSizedTextStyle(
                                                        8.0,
                                                        Theme.of(context)
                                                            .focusColor,
                                                        FontWeight
                                                            .w600,
                                                        'FontRegular'),
                                                    textAlign:
                                                    TextAlign
                                                        .center,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        flex: 1,
                                      ),
                                      Flexible(
                                        child: Container(
                                          decoration:
                                          BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                10.0),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "16",
                                                style: CustomWidget(context: context).CustomSizedTextStyle(
                                                    24.0,
                                                    Theme.of(context)
                                                        .focusColor,
                                                    FontWeight
                                                        .w700,
                                                    'FontRegular'),
                                                textAlign:
                                                TextAlign
                                                    .center,
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                widget.s_Date,
                                                style: CustomWidget(context: context).CustomSizedTextStyle(
                                                    10.0,
                                                    Theme.of(context)
                                                        .focusColor,
                                                    FontWeight
                                                        .w700,
                                                    'FontRegular'),
                                                textAlign:
                                                TextAlign
                                                    .center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        flex: 1,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      DottedLine(
                        direction: Axis.vertical,
                        dashColor:
                        Theme.of(context).dividerColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                        ),

                      ),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height *
                    0.26,
                width: MediaQuery.of(context).size.width,
                isCornerRounded: true,
              ),
            ),
            const SizedBox(height: 30.0,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            Home_Screen()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    60.0, 10.0, 60.0, 10.0),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(30.0),
                  color:
                  Theme.of(context).shadowColor,
                ),
                child: Text(
                  AppLocalizations.instance
                      .text("loc_done"),
                  style:
                  CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      14.0,
                      Theme.of(context)
                          .focusColor,
                      FontWeight.w800,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  storeData(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", name);
  }
}
