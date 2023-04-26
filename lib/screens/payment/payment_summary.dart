import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/dotted_line_widget.dart';
import '../../common/localization/localizations.dart';

class Payment_Summary_Screen extends StatefulWidget {
  const Payment_Summary_Screen({Key? key}) : super(key: key);

  @override
  State<Payment_Summary_Screen> createState() => _Payment_Summary_ScreenState();
}

class _Payment_Summary_ScreenState extends State<Payment_Summary_Screen> {

  bool checkHide=false;
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
              ],
            ),
          ),
        child: Stack(
          children: [
            // const SizedBox(height: 15.0,),
            Container(
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
                  const SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFF4F4F4),
                                const Color(0xFFFFFFFF),
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
                              SizedBox(width: 20.0,),
                              Text(
                                AppLocalizations.instance
                                    .text("loc_summary"),
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
                        ),
                        const SizedBox(height: 15.0,),
                        Text(
                          "Your saving total ₹1.2 on this order!",
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
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    height: 1.0,
                    color: Theme.of(context).accentColor,
                  ),
                  const SizedBox(height: 10.0,),
                  Padding(padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child:  Text(
                          "Deep clean AC service (window)",
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              10.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w400,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),flex: 2,),
                        Flexible(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap:(){
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "₹4.99",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      10.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w800,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 3.0,),
                                Text(
                                  "₹6.99",
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
                            )
                          ],
                        ),flex: 1,)

                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFF0DD8FF).withOpacity(0.1),
                    const Color(0xFF0FABFF).withOpacity(0.1),
                    const Color(0xFF1457FF).withOpacity(0.1),
                    const Color(0xFF1636FF).withOpacity(0.1),
                  ],
                ),
              ),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.22),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 20.0, bottom: 20.0),
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
                        children: [
                          Text(
                            AppLocalizations.instance
                                .text("loc_delivery_ins"),
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
                            children: [
                              Theme(
                                  data: ThemeData(
                                    primarySwatch: Colors.lightBlue,
                                    unselectedWidgetColor: Colors.black, // Your color
                                  ),
                                  child: SizedBox(
                                    height: 15.0,
                                    width: 15.0,
                                    child: Transform.scale(
                                      scale: 0.8,
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        value: checkHide,
                                        checkColor:   Theme.of(context).focusColor,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            checkHide = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  )),
                              const SizedBox(width: 8.0,),
                              Text(
                                AppLocalizations.instance.text("loc_avoid_call"),
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Container(
                      padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF0DD8FF).withOpacity(0.3),
                              const Color(0xFF0FABFF).withOpacity(0.3),
                              const Color(0xFF1457FF).withOpacity(0.3),
                              const Color(0xFF1636FF).withOpacity(0.3),
                              const Color(0xFF0E69C7).withOpacity(0.3),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context).splashColor,
                                blurRadius: 10.0,
                                offset: Offset(0.0, 0.5)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/coupon.svg", height: 20.0, ),
                              const SizedBox(width: 15.0,),
                              Text(
                                AppLocalizations.instance
                                    .text("loc_coupon_offer"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          // Flexible(child: ,flex: 1,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "4 offers",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).buttonColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(width: 10.0,),
                              Icon(Icons.arrow_forward_ios_rounded, size: 10.0, color: Theme.of(context).buttonColor,)
                            ],
                          )
                          // Flexible(child: ,flex: 1,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0,),

                    Container(
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).splashColor,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 0.5)
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 20.0, bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.instance
                                      .text("loc_payment_sum"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      16.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 20.0,),
                                Container(
                                  height: 1.0,
                                  color: Theme.of(context).dividerColor,
                                ),
                                const SizedBox(height: 20.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.instance
                                          .text("loc_total_item")+" :",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor.withOpacity(0.8),
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "₹"+"699",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor.withOpacity(0.8),
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 10.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.instance
                                          .text("loc_item_disc")+" :",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor.withOpacity(0.8),
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "₹"+"12",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor.withOpacity(0.8),
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 10.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.instance
                                          .text("loc_tax_fee")+" :",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor.withOpacity(0.8),
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "₹"+"199",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor.withOpacity(0.8),
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 20.0,),
                                Container(
                                  height: 1.0,
                                  color: Theme.of(context).dividerColor,
                                ),
                                const SizedBox(height: 25.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.instance
                                          .text("loc_total")+" :",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "₹"+"545",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 25.0,),
                                DottedLine(
                                  dashColor: Theme.of(context).dividerColor,
                                ),
                                const SizedBox(height: 25.0,),
                                Container(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).selectedRowColor.withOpacity(0.2),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/tag.png", height: 20.0,),
                                      const SizedBox(width: 8.0,),
                                      Text(
                                        "Yay! you have saved ₹1.2 on final bill",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            14.0,
                                            Theme.of(context).selectedRowColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            height: 1.0,
                            color: Theme.of(context).dividerColor,
                          ),
                          Container(
                            height: 100.0,
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20.0,),

                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 35.0),
                      child: InkWell(
                        onTap:(){

                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Theme.of(context).buttonColor,
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.instance
                                  .text("loc_pay_method"),
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
                    ),
                    const SizedBox(height: 20.0,),
                  ],
                ),
              ),
            )



          ],
        )
      )
    );
  }
}
