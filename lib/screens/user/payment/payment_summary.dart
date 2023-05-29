import 'package:coolwell_app/data/api_utils.dart';
import 'package:coolwell_app/data/model/create_complaint_model.dart';
import 'package:coolwell_app/data/model/get_services_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/dotted_line_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';

class Payment_Summary_Screen extends StatefulWidget {
  final GetServiceResult addedServiceDetails;
  final String serv_Date;
  final String serv_Time;
  final String type;
  final String address;
  final String city;
  final String zip;
  final String lat;
  final String long;
  const Payment_Summary_Screen({Key? key, required this.addedServiceDetails, required this.serv_Date, required this.serv_Time, required this.type, required this.address, required this.city, required this.zip, required this.lat, required this.long,}) : super(key: key);

  @override
  State<Payment_Summary_Screen> createState() => _Payment_Summary_ScreenState();
}

class _Payment_Summary_ScreenState extends State<Payment_Summary_Screen> {

  bool checkHide=false;
  APIUtils apiUtils = APIUtils();
  bool loading = false;
  double total=0.00;
  double amount=0.00;
  double discount=0.00;
  double tax=0.00;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount=double.parse(widget.addedServiceDetails.amount.toString());
    total=amount+discount+tax;
  }
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
                    color: Theme.of(context).dialogBackgroundColor,
                  ),
                  const SizedBox(height: 10.0,),
                  Padding(padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                               widget.addedServiceDetails.category!.name.toString(),

                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 3.0,),
                            Text(
                              widget.addedServiceDetails.serviceName.toString(),

                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w400,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),

                          ],
                        ),flex: 2,),

                        Flexible(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "₹ "+widget.addedServiceDetails.amount.toString(),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w800,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 3.0,),

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
                                    Theme.of(context).shadowColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(width: 10.0,),
                              Icon(Icons.arrow_forward_ios_rounded, size: 10.0, color: Theme.of(context).shadowColor,)
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
                                      "₹ "+ amount.toString(),
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
                                      "₹ "+ discount.toString(),
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
                                      "₹ "+tax.toString(),
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
                                      "₹ "+total.toString(),
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
                          setState(() {
                            loading=true;
                            createComplaint();
                          });

                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Theme.of(context).shadowColor,
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
            ),

            loading
                ? CustomWidget(context: context).loadingIndicator(
              Theme.of(context).cardColor,
            )
                : Container(),



          ],
        )
      )
    );
  }

  createComplaint() {

    apiUtils
        .createComplaintDetails(widget.addedServiceDetails.id.toString(), (widget.serv_Date.toString()+" "+widget.serv_Time.toString()), widget.address,widget.city, widget.zip, widget.lat.toString(), widget.long.toString(), widget.addedServiceDetails.amount.toString(),widget.type.toString())
        .then((CreateComplaintDetailsModel detailsModel) {
      if (detailsModel.success!) {
        setState(() {
          loading = false;
          CustomWidget(context: context)
              .custombar("Service", detailsModel.message.toString(), true);

        });
      } else {
        setState(() {
          loading = false;
          CustomWidget(context: context)
              .custombar("Service", detailsModel.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
}
