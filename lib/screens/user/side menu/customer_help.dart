import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/custom_widget.dart';
import '../../../common/localization/localizations.dart';

class Customer_Help_Support extends StatefulWidget {
  const Customer_Help_Support({Key? key}) : super(key: key);

  @override
  State<Customer_Help_Support> createState() => _Customer_Help_SupportState();
}

class _Customer_Help_SupportState extends State<Customer_Help_Support> {

  ScrollController _scrollController = ScrollController();

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
        child: Stack(
          children: [
            Container(
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
                                  Navigator.pop(context);
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
                              SizedBox(width: 15.0,),
                              Text(
                                AppLocalizations.instance
                                    .text("loc_cus_support"),
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              child: SingleChildScrollView(
                child: Container(
                  color: Theme.of(context).focusColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).focusColor,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child:  Text(
                              "Get quick customer support by selecting Your item",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),flex: 3,),
                            const SizedBox(width: 10.0,),
                            Flexible(child: Image.asset("assets/images/help.png"),flex: 2,),
                          ],
                        ),
                      ),
                      Container(
                        height: 15.0,
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
                      ),
                      Padding(padding: EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Text(
                        "Which service are you facing an issue with?",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),),
                      const SizedBox(height: 10.0,),
                      ListView.builder(
                        padding: EdgeInsets.zero,
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
                                  color: Theme.of(context).dialogBackgroundColor,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Container(
                        height: 15.0,
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
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).splashColor,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 0.5)
                              ),
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0,),
                            Text(
                              "What issue are you facing ?",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  18.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 10.0,),
                            ListTileTheme(
                              contentPadding: EdgeInsets.all(0),
                              child: Column(
                                children: [
                                  ExpansionTile(

                                    title: Text('Lorem ipsum dolor sit amet consectetur. Duis ?',style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                      textAlign: TextAlign.start,),
                                    children: <Widget>[
                                      ListTile(title: Text('Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                        textAlign: TextAlign.start,)),
                                    ],
                                  ),
                                  ExpansionTile(

                                    title: Text('Lorem ipsum dolor sit amet consectetur. Duis ?',style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                      textAlign: TextAlign.start,),
                                    children: <Widget>[
                                      ListTile(title: Text('Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                        textAlign: TextAlign.start,)),
                                    ],
                                  ),
                                  ExpansionTile(

                                    title: Text('Lorem ipsum dolor sit amet consectetur. Duis ?',style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                      textAlign: TextAlign.start,),
                                    children: <Widget>[
                                      ListTile(title: Text('Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                        textAlign: TextAlign.start,)),
                                    ],
                                  ),
                                  ExpansionTile(

                                    title: Text('Lorem ipsum dolor sit amet consectetur. Duis ?',style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                      textAlign: TextAlign.start,),
                                    children: <Widget>[
                                      ListTile(title: Text('Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                        textAlign: TextAlign.start,)),
                                    ],
                                  ),
                                  ExpansionTile(

                                    title: Text('Lorem ipsum dolor sit amet consectetur. Duis ?',style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                      textAlign: TextAlign.start,),
                                    children: <Widget>[
                                      ListTile(title: Text('Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                        textAlign: TextAlign.start,)),
                                    ],
                                  )
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                      Container(
                        height: 15.0,
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
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
