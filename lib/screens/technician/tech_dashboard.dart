import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Tech_DashBoard_Screen extends StatefulWidget {
  const Tech_DashBoard_Screen({Key? key}) : super(key: key);

  @override
  State<Tech_DashBoard_Screen> createState() => _Tech_DashBoard_ScreenState();
}

class _Tech_DashBoard_ScreenState extends State<Tech_DashBoard_Screen> {

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.26,
                  padding: EdgeInsets.only(left: 40.0,right: 30.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/tech/tech_dash_back.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             Notification_Screen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: SvgPicture.asset("assets/tech/chat.svg", height: 22.0,),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             Notification_Screen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: SvgPicture.asset("assets/images/notification.svg", height: 22.0,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        "Hi,",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).focusColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Vinoth Kumar",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            20.0,
                            Theme.of(context).focusColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1.0,color: Theme.of(context).accentColor,)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/search.svg", height: 20.0, color: Theme.of(context).accentColor,),
                      SizedBox(width: 10.0,),
                      Text(
                        AppLocalizations.instance
                            .text("loc_search"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w400,
                            'FontRegular'),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),),
              ],
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Container(
                     padding: EdgeInsets.only(left: 20.0, right: 20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text(
                           AppLocalizations.instance
                               .text("loc_let_serv"),
                           style: CustomWidget(context: context)
                               .CustomSizedTextStyle(
                               18.0,
                               Theme.of(context).primaryColor,
                               FontWeight.w600,
                               'FontRegular'),
                           textAlign: TextAlign.start,
                         ),
                         const SizedBox(height: 15.0,),
                         Container(
                           width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.height * 0.2,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0),
                           // color: Theme.of(context).primaryColor,
                           ),
                           child: Row(
                             children: [
                               Flexible(child: Container(
                                 decoration: BoxDecoration(
                                   // borderRadius: BorderRadius.only(
                                   //   topLeft: Radius.circular(10.0),
                                   //   bottomLeft: Radius.circular(10.0),
                                   // ),
                                   image: DecorationImage(
                                     image: AssetImage("assets/images/cleaning.png"),
                                     fit: BoxFit.fill,
                                   ),
                                 ),
                                 // child: Image.asset("assets/images/cleaning.png",),
                               ),flex: 1,),
                               Flexible(child: Container(
                                 padding: EdgeInsets.only(left: 10.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Text(
                                       AppLocalizations.instance
                                           .text("loc_dash_tech_txt1"),
                                       style: CustomWidget(context: context)
                                           .CustomSizedTextStyle(
                                           18.0,
                                           Theme.of(context).primaryColor,
                                           FontWeight.w600,
                                           'FontRegular'),
                                       textAlign: TextAlign.start,
                                     ),
                                     InkWell(
                                       onTap:(){

                                       },
                                       child: Container(
                                         padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(15.0),
                                           gradient: LinearGradient(
                                             begin: Alignment.topLeft,
                                             end: Alignment.bottomRight,
                                             colors: [
                                               const Color(0xFF0DD8FF),
                                               const Color(0xFF0FABFF),
                                               const Color(0xFF1457FF),
                                               const Color(0xFF1636FF),
                                               const Color(0xFF0E69C7),
                                             ],
                                           ),
                                         ),
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             SvgPicture.asset("assets/tech/assign.svg",color: Theme.of(context).focusColor, height: 15.0,),
                                             SizedBox(width: 5.0,),
                                             Text(
                                               AppLocalizations.instance
                                                   .text("loc_assign_order"),
                                               style: CustomWidget(context: context)
                                                   .CustomSizedTextStyle(
                                                   14.0,
                                                   Theme.of(context).focusColor,
                                                   FontWeight.w500,
                                                   'FontRegular'),
                                               textAlign: TextAlign.center,
                                             ),
                                           ],
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ), flex: 1,)
                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                    const SizedBox(height: 15.0,),

                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height *0.35,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context).splashColor,
                                    blurRadius: 15.0,
                                    offset: Offset(0.0, 0.8)
                                ),
                              ]
                          ),
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
                                          AppLocalizations.instance
                                              .text("loc_resend_completed_serv"),
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
                                                    AppLocalizations.instance
                                                        .text("loc_clean"),
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
                                                  .text("loc_you_got"),
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
                      itemCount: 3,
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
                                  // viewDetails();
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
                                                        .text("loc_on_progrss"),
                                                    style: CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        18.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                        textAlign: TextAlign.start,
                                                      ),

                                                      Icon(
                                                        Icons.arrow_forward_ios_rounded,
                                                        size: 15.0,
                                                        color:
                                                        Theme.of(context).primaryColor,
                                                      ),
                                                    ],
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
            ),




          ],
        ),
      ),
    );
  }
}
