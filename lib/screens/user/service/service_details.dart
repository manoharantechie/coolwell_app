import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/dotted_line_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';

import '../../../common/textformfield_custom.dart';
import '../../../data/api_utils.dart';
import '../../../data/model/get_services_details.dart';
import '../profile/slot_screen.dart';

class Service_Details_Screen extends StatefulWidget {
  final S_id;

  const Service_Details_Screen({
    Key? key,
    required this.S_id,
  }) : super(key: key);

  @override
  State<Service_Details_Screen> createState() => _Service_Details_ScreenState();
}

class _Service_Details_ScreenState extends State<Service_Details_Screen> {
  ScrollController _scrollController = ScrollController();
  ScrollController controller = ScrollController();
  APIUtils apiUtils = APIUtils();
  bool loading = false;
  bool add = false;
  bool remove = false;
  bool serviceAdd = false;
  List<GetServiceResult> totalDetails = [];
  GetServiceResult? addedServiceDetails;
  List<String> text_drop = [
    "Experienced\nprofessionals",
    "Background\nverified",
    "Background\nverified"
  ];
  FocusNode issuesFocus = FocusNode();
  TextEditingController issuesController = TextEditingController();

  List<String> selectedService = [];

  String amount = "0";

  @override
  void initState() {
    // TODO: implement initState
    loading = true;
    getServicesData();
    super.initState();
  }

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
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/service.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
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
                                SizedBox(
                                  width: 20.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).splashColor,
                                        border: Border.all(
                                          width: 1.0,
                                          color: Theme.of(context).focusColor,
                                        )),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/images/search.svg",
                                        height: 22.0,
                                        color: Theme.of(context).focusColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40.0,
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
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 15.0,
                                        color: Theme.of(context).cardColor,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.only(left: 20.0),
                      height: 90.0,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
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
                                    Flexible(
                                      child:
                                          Image.asset("assets/images/tag.png"),
                                      flex: 1,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Flexible(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.instance
                                              .text("loc_buy_save"),
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w400,
                                                  'FontRegular'),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "30% off 2nd item onwards",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  10.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w400,
                                                  'FontRegular'),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              totalDetails.length > 0
                  ? Container(
                      color: Theme.of(context).focusColor,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.44),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                          child: Container(
                              child: SingleChildScrollView(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: totalDetails.length,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              controller: controller,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          serviceAdd = false;

                                          if (selectedService.contains(
                                              totalDetails[index]
                                                  .id
                                                  .toString())) {
                                            serviceAdd = true;
                                          } else {
                                            serviceAdd = false;
                                          }
                                        });
                                        viewDetailsProcess(totalDetails[index]);
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        decoration: BoxDecoration(
                                            // image: DecorationImage(
                                            //   image: AssetImage("assets/images/services.png",),
                                            //   fit: BoxFit.cover,
                                            // ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Theme.of(context).focusColor,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Theme.of(context)
                                                      .splashColor,
                                                  blurRadius: 10.0,
                                                  offset: Offset(0.0, 0.5)),
                                            ]),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 15.0, 15.0, 15.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(6.0),
                                                    bottomLeft:
                                                        Radius.circular(6.0),
                                                  ),
                                                  // color: Theme.of(context)
                                                  //     .focusColor,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      // AppLocalizations.instance
                                                      //     .text("loc_cleaning"),
                                                      // totalDetails[index]
                                                      //     .serviceName
                                                      //     .toString(),
                                                      totalDetails[index]
                                                          .serviceName
                                                          .toString(),
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              18.0,
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              FontWeight.w600,
                                                              'FontRegular'),
                                                      textAlign:
                                                          TextAlign.center,
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
                                                          color:
                                                              Theme.of(context)
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
                                                                      .primaryColor,
                                                                  FontWeight
                                                                      .w400,
                                                                  'FontRegular'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                            child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "₹" +
                                                                  totalDetails[
                                                                          index]
                                                                      .amount!
                                                                      .toString(),
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
                                                              width: 10.0,
                                                            ),
                                                            Container(
                                                              height: 12.0,
                                                              width: 1.0,
                                                              color: Theme.of(
                                                                      context)
                                                                  .dialogBackgroundColor,
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
                                                                      .dialogBackgroundColor,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        )),
                                                        Flexible(
                                                            child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                              width: 2.0,
                                                              height: 2.0,
                                                            ),
                                                            SizedBox(
                                                              width: 5.0,
                                                            ),
                                                            Text(
                                                              // "45 mins",
                                                              totalDetails[
                                                                      index]
                                                                  .time!
                                                                  .toString(),
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
                                                        ))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Container(
                                                      height: 1.0,
                                                      color: Theme.of(context)
                                                          .dialogBackgroundColor,
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                            "assets/images/tag.png"),
                                                        SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Text(
                                                          // "30% off 2nd item onwards",
                                                          totalDetails[index]
                                                              .notes!
                                                              .toString(),
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
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    DottedLine(
                                                      dashColor: Theme.of(
                                                              context)
                                                          .dialogBackgroundColor,
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 2.0,
                                                          height: 2.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Theme.of(
                                                                    context)
                                                                .selectedRowColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Text(
                                                          // "Get 2x deeper dust removel with unique technology",
                                                          totalDetails[index]
                                                              .checkList![index]
                                                              .toString(),
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomSizedTextStyle(
                                                                  7.0,
                                                                  Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  FontWeight
                                                                      .w400,
                                                                  'FontRegular'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 2.0,
                                                          height: 2.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Theme.of(
                                                                    context)
                                                                .selectedRowColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Text(
                                                          // "Get 2x deeper dust removel with unique technology",
                                                          totalDetails[index]
                                                              .checkList![index]
                                                              .toString(),
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomSizedTextStyle(
                                                                  7.0,
                                                                  Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  FontWeight
                                                                      .w400,
                                                                  'FontRegular'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Navigator.of(context).push(
                                                        //     MaterialPageRoute(
                                                        //         builder:
                                                        //             (context) =>
                                                        //             Service_Details_Screen()));
                                                      },
                                                      child: Text(
                                                        AppLocalizations
                                                            .instance
                                                            .text(
                                                                "loc_view_details"),
                                                        style: CustomWidget(
                                                                context:
                                                                    context)
                                                            .CustomSizedTextStyle(
                                                                8.0,
                                                                Theme.of(
                                                                        context)
                                                                    .shadowColor,
                                                                FontWeight.w400,
                                                                'FontRegular'),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                            Flexible(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 15.0, 10.0, 15.0),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    // image: AssetImage(
                                                    //     "assets/images/cleaning.png"),
                                                    // image: NetworkImage("http://164.92.128.14:5000/images/1681825904905_dikin.png"),
                                                    image: NetworkImage(
                                                        totalDetails[index]
                                                            .category!
                                                            .image
                                                            .toString()),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(6.0),
                                                    bottomRight:
                                                        Radius.circular(6.0),
                                                  ),
                                                  // color: Theme.of(context)
                                                  //     .focusColor,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5,
                                                                5.0,
                                                                5.0,
                                                                5.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                          color:
                                                              Theme.of(context)
                                                                  .shadowColor,
                                                        ),
                                                        child: Text(
                                                          // "61% OFF",
                                                          totalDetails[index]
                                                                  .category!
                                                                  .offer!
                                                                  .toString() +
                                                              " OFF",
                                                          // totalService[index].offer.toString() + " Off",
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomSizedTextStyle(
                                                                  14.0,
                                                                  Theme.of(
                                                                          context)
                                                                      .focusColor,
                                                                  FontWeight
                                                                      .w800,
                                                                  'FontRegular'),
                                                          textAlign:
                                                              TextAlign.end,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedService
                                                              .clear();
                                                          amount = "0";
                                                          if (selectedService
                                                                  .length >
                                                              0) {
                                                            if (selectedService
                                                                .contains(totalDetails[
                                                                        index]
                                                                    .id
                                                                    .toString())) {
                                                              selectedService.remove(
                                                                  totalDetails[
                                                                          index]
                                                                      .id
                                                                      .toString());

                                                              amount = (double.parse(
                                                                          amount) -
                                                                      double.parse(totalDetails[
                                                                              index]
                                                                          .amount
                                                                          .toString()))
                                                                  .toString();
                                                            } else {
                                                              addedServiceDetails =
                                                                  totalDetails[
                                                                      index];
                                                              selectedService.add(
                                                                  totalDetails[
                                                                          index]
                                                                      .id
                                                                      .toString());
                                                              amount = (double.parse(
                                                                          amount) +
                                                                      double.parse(totalDetails[
                                                                              index]
                                                                          .amount
                                                                          .toString()))
                                                                  .toString();
                                                            }
                                                          } else {
                                                            addedServiceDetails =
                                                                totalDetails[
                                                                    index];

                                                            selectedService.add(
                                                                totalDetails[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                            amount = (double.parse(
                                                                        amount) +
                                                                    double.parse(totalDetails[
                                                                            index]
                                                                        .amount
                                                                        .toString()))
                                                                .toString();
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 10.0),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.18,
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5.0,
                                                                5.0,
                                                                5.0,
                                                                5.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              const Color(
                                                                  0xFF0DD8FF),
                                                              const Color(
                                                                  0xFF0FABFF),
                                                              const Color(
                                                                  0xFF1457FF),
                                                              const Color(
                                                                  0xFF1636FF),
                                                              const Color(
                                                                  0xFF0E69C7),
                                                            ],
                                                          ),
                                                        ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SvgPicture.asset(
                                                              "assets/images/tools.svg",
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor,
                                                              height: 15.0,
                                                            ),
                                                            SizedBox(
                                                              width: 5.0,
                                                            ),
                                                            Text(
                                                              selectedService.contains(
                                                                      totalDetails[
                                                                              index]
                                                                          .id
                                                                          .toString())
                                                                  ? AppLocalizations
                                                                      .instance
                                                                      .text(
                                                                          "loc_remove")
                                                                  : AppLocalizations
                                                                      .instance
                                                                      .text(
                                                                          "loc_add"),
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      10.0,
                                                                      Theme.of(
                                                                              context)
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
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              flex: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    )
                                  ],
                                );
                              },
                            ),
                          ))),
                    )
                  : Center(
                      child: loading
                          ? CustomWidget(context: context).loadingIndicator(
                              Theme.of(context).cardColor,
                            )
                          : Container(
                              child: Center(
                                child: Text(
                                  AppLocalizations.instance
                                      .text("loc_no_records"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                    ),
              selectedService.length > 0
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 35.0, right: 35.0, bottom: 30.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 13.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/tools.svg",
                                            color: Theme.of(context).focusColor,
                                            height: 15.0,
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            AppLocalizations.instance
                                                .text("loc_service"),
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context)
                                                            .focusColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "₹" + amount,
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              14.0,
                                              Theme.of(context).focusColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  viewDetails(addedServiceDetails!);
                                });
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(25.0, 13.0, 25.0, 13.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Theme.of(context).shadowColor,
                                ),
                                child: Text(
                                  AppLocalizations.instance
                                      .text("loc_view_cart"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).focusColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
              loading
                  ? CustomWidget(context: context).loadingIndicator(
                      Theme.of(context).cardColor,
                    )
                  : Container(),
            ],
          )),
    );
  }

  viewDetails(GetServiceResult details) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(),
        backgroundColor: Colors.transparent,
        enableDrag: true,
        context: context,
        builder: (BuildContext con) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter ssetState) {
            return Container(
              margin: EdgeInsets.only(top: 5.0),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                right: 15.0,
                left: 15.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )),
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
                              SvgPicture.asset(
                                "assets/images/shield.svg",
                                height: 40.0,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    details.serviceName.toString(),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            18.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
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
                          const SizedBox(
                            height: 15.0,
                          ),
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
                          const SizedBox(
                            height: 15.0,
                          ),
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
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            serviceAdd = false;

                            if (selectedService
                                .contains(details.id.toString())) {
                              serviceAdd = true;
                            } else {
                              serviceAdd = false;
                            }

                            viewDetailsProcess(details);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Theme.of(context).shadowColor,
                          ),
                          child: Text(
                            AppLocalizations.instance.text("loc_proceed"),
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
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  viewDetailsProcess(GetServiceResult details) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        enableDrag: true,
        context: context,
        builder: (BuildContext con) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter ssetState) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )),
              margin: EdgeInsets.only(top: 5.0),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                right: 15.0,
                left: 15.0,
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: controller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8.0,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              ssetState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 86.0,
                              height: 3.0,
                              color: Theme.of(context).backgroundColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // image: DecorationImage(
                                    //   image: NetworkImage(details.coverImage.toString()),
                                    //   fit: BoxFit.cover,
                                    // ),
                                    border: Border.all(
                                      width: 1.0,
                                      color: Theme.of(context).cardColor,
                                    )),
                                child: Image.network(
                                  details.category!.image.toString(),
                                  height: 160.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      details.serviceName.toString(),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          18.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ssetState(() {
                                          if (serviceAdd) {
                                            serviceAdd = false;
                                          } else {
                                            serviceAdd = true;
                                          }

                                          setState(() {
                                            selectedService.clear();
                                            amount = "0";
                                            if (selectedService.length > 0) {
                                              if (selectedService.contains(
                                                  details.id.toString())) {
                                                selectedService
                                                    .remove(details.id.toString());
                                                amount = (double.parse(amount) -
                                                    double.parse(details.amount
                                                        .toString()))
                                                    .toString();
                                              } else {
                                                selectedService
                                                    .add(details.id.toString());
                                                addedServiceDetails = details;
                                                amount = (double.parse(amount) +
                                                    double.parse(details.amount
                                                        .toString()))
                                                    .toString();
                                              }
                                            } else {
                                              addedServiceDetails = details;
                                              selectedService
                                                  .add(details.id.toString());
                                              amount = (double.parse(amount) +
                                                  double.parse(details.amount
                                                      .toString()))
                                                  .toString();
                                            }
                                          });
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 5.0, 10.0, 5.0),
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
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/tools.svg",
                                              color: Theme.of(context).focusColor,
                                              height: 15.0,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              serviceAdd
                                                  ? AppLocalizations.instance
                                                  .text("loc_remove")
                                                  : AppLocalizations.instance
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
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15.0,
                                    color: Theme.of(context).cardColor,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
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
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹" + details.amount.toString(),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        13.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w800,
                                        'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "₹649",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w600,
                                        color:
                                        Theme.of(context).dialogBackgroundColor,
                                        fontStyle: FontStyle.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        width: 2.0,
                                        height: 2.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        // "45 mins",
                                        details.time.toString(),
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
                              SizedBox(
                                height: 10.0,
                              ),
                              DottedLine(
                                dashColor: Theme.of(context).dialogBackgroundColor,
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.instance
                                          .text("loc_service_coolwell"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w800,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      height: 85.0,
                                      child: ListView.builder(
                                        itemCount: text_drop.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        controller: _scrollController,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.45,
                                                padding: EdgeInsets.fromLTRB(
                                                    15.0, 10.0, 15.0, 10.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10.0),
                                                    color: Color(0xFF0DD8FF)
                                                        .withOpacity(0.5)),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              text_drop[index]
                                                                  .toString(),
                                                              style: CustomWidget(
                                                                  context: context)
                                                                  .CustomSizedTextStyle(
                                                                  10.0,
                                                                  Theme.of(context)
                                                                      .primaryColor,
                                                                  FontWeight.w500,
                                                                  'FontRegular'),
                                                            ),
                                                          ],
                                                        )),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Flexible(
                                                      child: Image.asset(
                                                          "assets/images/service_man.png"),
                                                      flex: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.0,
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 1.0,
                                color: Theme.of(context).dialogBackgroundColor,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.45,
                                            padding: EdgeInsets.fromLTRB(
                                                15.0, 10.0, 15.0, 10.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.0),
                                                color: Color(0xFF0DD8FF)
                                                    .withOpacity(0.5)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "CW verified repair quotes",
                                                  style: CustomWidget(
                                                      context: context)
                                                      .CustomSizedTextStyle(
                                                      14.0,
                                                      Theme.of(context)
                                                          .primaryColor,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                                ),
                                                Align(
                                                  alignment:
                                                  Alignment.bottomRight,
                                                  child: SvgPicture.asset(
                                                      "assets/images/verify.svg"),
                                                )
                                              ],
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.45,
                                            padding: EdgeInsets.fromLTRB(
                                                15.0, 10.0, 15.0, 10.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.0),
                                                color: Color(0xFF0DD8FF)
                                                    .withOpacity(0.5)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Talk to expert \nfree",
                                                  style: CustomWidget(
                                                      context: context)
                                                      .CustomSizedTextStyle(
                                                      14.0,
                                                      Theme.of(context)
                                                          .primaryColor,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                                ),
                                                Align(
                                                  alignment:
                                                  Alignment.bottomRight,
                                                  child: SvgPicture.asset(
                                                      "assets/images/customer.svg"),
                                                )
                                              ],
                                            ),
                                          ),
                                          flex: 1,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.45,
                                            padding: EdgeInsets.fromLTRB(
                                                15.0, 10.0, 15.0, 10.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.0),
                                                color: Color(0xFF0DD8FF)
                                                    .withOpacity(0.5)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Upto 30 days\nwarranty ",
                                                  style: CustomWidget(
                                                      context: context)
                                                      .CustomSizedTextStyle(
                                                      14.0,
                                                      Theme.of(context)
                                                          .primaryColor,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                                ),
                                                Align(
                                                  alignment:
                                                  Alignment.bottomRight,
                                                  child: SvgPicture.asset(
                                                      "assets/images/certificate.svg"),
                                                )
                                              ],
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.45,
                                            padding: EdgeInsets.fromLTRB(
                                                15.0, 10.0, 15.0, 10.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.0),
                                                color: Color(0xFF0DD8FF)
                                                    .withOpacity(0.5)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "No questions/nasked claim",
                                                  style: CustomWidget(
                                                      context: context)
                                                      .CustomSizedTextStyle(
                                                      14.0,
                                                      Theme.of(context)
                                                          .primaryColor,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                                ),
                                                Align(
                                                  alignment:
                                                  Alignment.bottomRight,
                                                  child: SvgPicture.asset(
                                                      "assets/images/doller.svg"),
                                                )
                                              ],
                                            ),
                                          ),
                                          flex: 1,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).focusColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context).splashColor,
                                          blurRadius: 10.0,
                                          offset: Offset(0.0, 0.5)),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.instance
                                          .text("loc_service_note"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w800,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormFieldCustom(
                                      onEditComplete: () {
                                        issuesFocus.unfocus();
                                        // FocusScope.of(context).requestFocus(phoneNumFocus);
                                      },
                                      radius: 6.0,
                                      error: "Enter Full Name",
                                      textColor: Theme.of(context).primaryColor,
                                      borderColor: Theme.of(context).dividerColor,
                                      fillColor: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.6),
                                      hintStyle: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textStyle: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                      textInputAction: TextInputAction.next,
                                      focusNode: issuesFocus,
                                      maxlines: 6,
                                      text: '',
                                      hintText: "Explain your issues",
                                      obscureText: false,
                                      textChanged: (value) {},
                                      onChanged: () {},
                                      suffix: Container(
                                        width: 0.0,
                                      ),
                                      validator: (value) {},
                                      enabled: true,
                                      textInputType: TextInputType.text,
                                      controller: issuesController,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).focusColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context).splashColor,
                                          blurRadius: 10.0,
                                          offset: Offset(0.0, 0.5)),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      AppLocalizations.instance.text("loc_faq"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w800,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    ListTileTheme(
                                      contentPadding: EdgeInsets.all(0),
                                      child: Column(
                                        children: [
                                          ExpansionTile(
                                            title: Text(
                                              'Lorem ipsum dolor sit amet consectetur. Duis ?',
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.start,
                                            ),
                                            children: <Widget>[
                                              ListTile(
                                                  title: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',
                                                    style:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ],
                                          ),
                                          ExpansionTile(
                                            title: Text(
                                              'Lorem ipsum dolor sit amet consectetur. Duis ?',
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.start,
                                            ),
                                            children: <Widget>[
                                              ListTile(
                                                  title: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',
                                                    style:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ],
                                          ),
                                          ExpansionTile(
                                            title: Text(
                                              'Lorem ipsum dolor sit amet consectetur. Duis ?',
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.start,
                                            ),
                                            children: <Widget>[
                                              ListTile(
                                                  title: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',
                                                    style:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ],
                                          ),
                                          ExpansionTile(
                                            title: Text(
                                              'Lorem ipsum dolor sit amet consectetur. Duis ?',
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.start,
                                            ),
                                            children: <Widget>[
                                              ListTile(
                                                  title: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',
                                                    style:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ],
                                          ),
                                          ExpansionTile(
                                            title: Text(
                                              'Lorem ipsum dolor sit amet consectetur. Duis ?',
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.start,
                                            ),
                                            children: <Widget>[
                                              ListTile(
                                                  title: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Pretium nulla lorem ultricies molestie sed euismod facilisis aliquet turpis. Tortor vitae ultricies condimentum sit. Vel diam ultrices ut felis duis potenti nunc lacinia. Et.',
                                                    style:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  serviceAdd
                      ? Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Slot_Screen(
                                      addedServiceDetails:
                                      addedServiceDetails!,
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.fromLTRB(
                            35.0, 10.0, 35.0, 10.0),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30.0),
                          color:
                          Theme.of(context).shadowColor,
                        ),
                        child: Text(
                          AppLocalizations.instance
                              .text("loc_proceed_book"),
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
                    ),
                  )
                      : Container(),
                ],
              ),
            );
          });
        });
  }

  getServicesData() {
    apiUtils
        .getServicesDetails(widget.S_id)
        .then((GetServiceDetails DetailsModel) {
      if (DetailsModel.success!) {
        setState(() {
          totalDetails = DetailsModel.result!;
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
          CustomWidget(context: context)
              .custombar("Service", DetailsModel.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
}
