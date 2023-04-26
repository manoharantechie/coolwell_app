import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/dotted_line_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';

class Service_Details_Screen extends StatefulWidget {
  const Service_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Service_Details_Screen> createState() => _Service_Details_ScreenState();
}

class _Service_Details_ScreenState extends State<Service_Details_Screen> {

  ScrollController _scrollController = ScrollController();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/service.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0,30.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        size: 22.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                    });
                                  },
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
                            const SizedBox(height: 40.0,),
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
                    ),
                    const SizedBox(height: 20.0,),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.only(left: 20.0),
                      height: 90.0,
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
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).focusColor,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.36),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                    child: Container(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            controller: controller,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.24,
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
                                                // texts[index].toString(),
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
                                                        style: TextStyle(
                                                            fontSize: 10.0,
                                                            decoration: TextDecoration.lineThrough,
                                                            fontWeight: FontWeight.w600,
                                                            color: Theme.of(context).accentColor,
                                                            fontStyle: FontStyle.normal
                                                        ),
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
                                          padding: EdgeInsets.fromLTRB(10, 15.0, 10.0, 15.0),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/cleaning.png"),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(6.0),
                                              bottomRight:  Radius.circular(6.0),
                                            ),
                                            color: Theme.of(context).focusColor,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
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
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.15,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap:(){
                                                        viewDetails();
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width * 0.3,
                                                        padding: EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15.0),
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
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: Theme.of(context).primaryColor,
                                                                  size: 10.0,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(width: 8.0,),
                                                            Text(
                                                              "1",
                                                              style: CustomWidget(context: context)
                                                                  .CustomSizedTextStyle(
                                                                  10.0,
                                                                  Theme.of(context).focusColor,
                                                                  FontWeight.w600,
                                                                  'FontRegular'),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                            const SizedBox(width: 8.0,),
                                                            Container(
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: Theme.of(context).primaryColor,
                                                                  size: 10.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5.0,),
                                                    Text(
                                                      "4 options",
                                                      style: CustomWidget(context: context)
                                                          .CustomSizedTextStyle(
                                                          6.0,
                                                          Theme.of(context).primaryColor,
                                                          FontWeight.w400,
                                                          'FontRegular'),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),flex: 1,)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15.0,)
                                ],
                              );
                            },
                          ),
                        )
                    )
                ),
              ),
            ],
          )
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
                  padding: EdgeInsets.only(right: 15.0, left: 15.0,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    )
                  ),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 30.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("assets/images/shield.svg", height: 40.0,),
                                  const SizedBox(width: 10.0,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                  AppLocalizations.instance
                                      .text("loc_ac_txt1"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            18.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 8.0,),
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_ac_txt2"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 15.0,),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 15.0,),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.start,
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child:  InkWell(
                            onTap:(){

                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Theme.of(context).buttonColor,
                              ),
                              child: Text(
                                AppLocalizations.instance
                                    .text("loc_proceed"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height:10.0,
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
