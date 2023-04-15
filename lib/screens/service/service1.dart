import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/dotted_line_widget.dart';
import '../../common/localization/localizations.dart';

class Service1_Screen extends StatefulWidget {
  const Service1_Screen({Key? key}) : super(key: key);

  @override
  State<Service1_Screen> createState() => _Service1_ScreenState();
}

class _Service1_ScreenState extends State<Service1_Screen> {

  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Flexible(child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/service.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).cardColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).splashColor,
                              border: Border.all(width: 1.0,color: Theme.of(context).focusColor,)
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/search.svg",
                                height: 22.0,
                                color:  Theme.of(context).focusColor,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.instance
                                .text("loc_services"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                26.0,
                                Theme.of(context).focusColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Theme.of(context).cardColor,
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                "4.81 (1.2M Booking)",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),flex: 2,),
            Flexible(child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Container(
                     height: 85.0,
                     child:  ListView.builder(
                       itemCount: 3,
                       scrollDirection: Axis.horizontal,
                       shrinkWrap: true,
                       controller: _scrollController,
                       itemBuilder: (BuildContext context, int index) {
                         return Row(
                           children: [
                             Container(
                               width: MediaQuery.of(context).size.width * 0.75,
                               padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15.0),
                                 gradient: LinearGradient(
                                   begin: Alignment.topLeft,
                                   end: Alignment.bottomRight,
                                   colors: [
                                     const Color(0xFF0DD8FF).withOpacity(0.5),
                                     const Color(0xFF0FABFF).withOpacity(0.5),
                                     const Color(0xFF1457FF).withOpacity(0.5),
                                     const Color(0xFF1636FF).withOpacity(0.5),
                                     const Color(0xFF0E69C7).withOpacity(0.5),
                                   ],
                                 ),
                               ),
                               child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Flexible(child: Image.asset("assets/images/tag.png"),flex: 1,),
                                   SizedBox(width: 5.0,),
                                   Flexible(child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         AppLocalizations.instance
                                             .text("loc_buy_save"),
                                         style: CustomWidget(context: context)
                                             .CustomSizedTextStyle(
                                             14.0,
                                             Theme.of(context).primaryColor,
                                             FontWeight.w400,
                                             'FontRegular'),
                                       ),
                                       SizedBox(height: 5.0,),
                                       Text(
                                         "30% off 2nd item onwards",
                                         style: CustomWidget(context: context)
                                             .CustomSizedTextStyle(
                                             10.0,
                                             Theme.of(context).primaryColor,
                                             FontWeight.w400,
                                             'FontRegular'),
                                       ),
                                     ],
                                   ))
                                 ],
                               ),
                             ),
                             SizedBox(width: 15.0,)
                           ],
                         );
                       },
                     ),
                   ),


                    SizedBox(height: 20.0,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Flexible(child: Container(
                            padding: EdgeInsets.fromLTRB(15, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6.0),
                                  bottomLeft:  Radius.circular(6.0),
                                ),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.instance
                                      .text("loc_cleaning"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      18.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15.0,
                                      color: Theme.of(context).cardColor,
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(
                                      "4.81 (1.2M)",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    Flexible(child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "₹499",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              13.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w800,
                                              'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(width: 10.0,),
                                        Container(
                                          height: 12.0,
                                          width: 1.0,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        SizedBox(width: 10.0,),
                                        Text(
                                          "₹649",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              10.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                    Flexible(child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                          width: 2.0,
                                          height: 2.0,

                                        ),
                                        SizedBox(width: 5.0,),
                                        Text(
                                          "45 mins",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              10.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w400,
                                              'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                                SizedBox(height: 10.0,),
                                Container(
                                  height: 1.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                SizedBox(height: 10.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/tag.png"),
                                    SizedBox(width: 5.0,),
                                    Text(
                                      "30% off 2nd item onwards",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0,),
                                DottedLine(
                                  dashColor: Theme.of(context).accentColor,
                                ),
                                SizedBox(height: 10.0,),

                                Row(
                                  children: [
                                    Container(width: 2.0,height: 2.0, decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).selectedRowColor,),),
                                    SizedBox(width: 5.0,),
                                    Text(
                                      "Get 2x deeper dust removel with unique technology",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          7.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(width: 2.0,height: 2.0, decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).selectedRowColor,),),
                                    SizedBox(width: 5.0,),
                                    Text(
                                      "Get 2x deeper dust removel with unique technology",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          7.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Text(
                                  AppLocalizations.instance
                                      .text("loc_view_details"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).buttonColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),


                              ],
                            ),
                          ),flex: 2,),
                          Flexible(child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(15, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/cleaning.png"),
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6.0),
                                bottomRight:  Radius.circular(6.0),
                              ),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Theme.of(context).buttonColor,
                            ),
                                  child: Text(
                                    "61% OFF",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).focusColor,
                                        FontWeight.w800,
                                        'FontRegular'),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                SizedBox(height: 50.0,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
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
                                      SvgPicture.asset("assets/images/tools.svg",color: Theme.of(context).focusColor, height: 18.0,),
                                      SizedBox(height: 20.0,),
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_add"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).focusColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),flex: 1,)
                        ],
                        
                      ),
                    )
                  ],
                ),
              ),
            ),flex: 8,)
          ],
        ),
      ),
    );
  }

}

