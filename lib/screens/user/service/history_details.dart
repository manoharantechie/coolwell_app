import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coolwell_app/common/textformfield_custom.dart';
import '../../../data/api_utils.dart';
import '../../../data/model/user_service_history_details_model.dart';

class Service_History_Details extends StatefulWidget {
  final String h_id;
  const Service_History_Details({Key? key,  required this.h_id}) : super(key: key);

  @override
  State<Service_History_Details> createState() =>
      _Service_History_DetailsState();
}

class _Service_History_DetailsState extends State<Service_History_Details> {
  ScrollController _scrollController = ScrollController();
  bool photos = true;
  bool video = false;
  FocusNode reviewFocus = FocusNode();
  TextEditingController reviewController = TextEditingController();

  bool loading = false;
  APIUtils apiUtils = APIUtils();
  UsersHistoryResult? OrderFullList;
  String servicename ="";
  String technicianNum ="";
  String technicianName ="";
  var diff ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    servicesDetails();


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: loading
          ? CustomWidget(context: context).loadingIndicator(
        Theme.of(context).cardColor,
      )
          :  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 30.0),
        color: Theme.of(context).focusColor,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 30.0),
                width: MediaQuery.of(context).size.width,
                height: 35.0,
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                       padding: EdgeInsets.only(right: 50.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                         gradient: LinearGradient(
                           begin: Alignment.centerLeft,
                           end: Alignment.centerRight,
                           colors: [
                             const Color(0xFFF4F4F4).withOpacity(0.8),
                             const Color(0xFFF4F4F4).withOpacity(0.5),
                             const Color(0xFFF4F4F4).withOpacity(0.2),
                           ],
                         ),
                       ),
                       child: Row(
                         children: [
                           InkWell(
                             onTap: () {
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
                                   size: 20.0,
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(width: 10.0,),
                           Text(
                             AppLocalizations.instance.text("loc_serv_his"),
                             style: CustomWidget(context: context)
                                 .CustomSizedTextStyle(
                                 18.0,
                                 Theme.of(context).primaryColor,
                                 FontWeight.w400,
                                 'FontRegular'),
                             textAlign: TextAlign.start,
                           ),
                         ],
                       ),
                     ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
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
                    )
                  ],
                )),
            const SizedBox(
              height: 5.0,
            ),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 1.0,
                        color: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 0.5)),
                            ]),
                        child: Text(
                          // "Deep clean AC Service",
                          servicename.toString(),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                                  18.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 0.5)),
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       AppLocalizations.instance.text("loc_tech_name"),
                            //       style: CustomWidget(context: context)
                            //           .CustomSizedTextStyle(
                            //           18.0,
                            //           Theme.of(context).primaryColor,
                            //           FontWeight.w700,
                            //           'FontRegular'),
                            //       textAlign: TextAlign.start,
                            //     ),
                            //     const SizedBox(height: 2.0,),
                            //     Text(
                            //       AppLocalizations.instance.text("loc_tech_id"),
                            //       style: CustomWidget(context: context)
                            //           .CustomSizedTextStyle(
                            //           10.0,
                            //           Theme.of(context).primaryColor,
                            //           FontWeight.w700,
                            //           'FontRegular'),
                            //       textAlign: TextAlign.start,
                            //     ),
                            //   ],
                            // ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    technicianName.toString(),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            18.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 2.0,
                                  ),
                                  // Text(
                                  //   AppLocalizations.instance
                                  //       .text("loc_tech_id"),
                                  //   style: CustomWidget(context: context)
                                  //       .CustomSizedTextStyle(
                                  //           10.0,
                                  //           Theme.of(context).primaryColor,
                                  //           FontWeight.w700,
                                  //           'FontRegular'),
                                  //   textAlign: TextAlign.start,
                                  // ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Theme.of(context).primaryColor,
                                        size: 20.0,
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        technicianNum.toString(),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                12.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.instance
                                        .text("loc_overall_rate"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            9.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dialogBackgroundColor
                                                      .withOpacity(0.5),
                                                )),
                                            child: SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "1",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dialogBackgroundColor
                                                      .withOpacity(0.5),
                                                )),
                                            child: SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "2",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dialogBackgroundColor
                                                      .withOpacity(0.5),
                                                )),
                                            child: SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "3",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1.0,
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                              color:
                                                  Theme.of(context).cardColor,
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/images/star.svg",
                                                height: 15.0,
                                                color: Theme.of(context)
                                                    .focusColor),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "4",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dialogBackgroundColor
                                                      .withOpacity(0.5),
                                                )),
                                            child: SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "5",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                    ],
                                  )
                                ],
                              ),
                              flex: 1,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 0.5)),
                            ]),
                        child: Column(
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

                            OrderFullList!.service!.checkList!.length>0 ? ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: OrderFullList!.service!.checkList!.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              controller: _scrollController,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            // AppLocalizations.instance
                                            //     .text("loc_clean_foam"),
                                            OrderFullList!.service!.checkList![index].toString(),
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
                                  ],
                                );
                              },
                            ) : Container(),

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
                                          // diff.toString(),
                                          "-",
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
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 0.5)),
                            ]),
                        child: Column(
                          children: [
                            GridView.builder(
                                itemCount: 15,
                                shrinkWrap: true,
                                controller: _scrollController,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 15.0,
                                  childAspectRatio: 1.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.16,
                                          padding: EdgeInsets.all(10.0),
                                          // height: 100.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0,
                                              color: Theme.of(context)
                                                  .dialogBackgroundColor
                                                  .withOpacity(0.5),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            color: Theme.of(context)
                                                .dividerColor
                                                .withOpacity(0.2),
                                          ),
                                          child: Center(
                                              child: Icon(
                                            index == 0
                                                ? Icons.camera_alt_rounded
                                                : Icons.image,
                                            size: 22.0,
                                            color: Theme.of(context)
                                                .dialogBackgroundColor
                                                .withOpacity(0.5),
                                          )),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        photos = true;
                                        video = false;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      decoration: photos
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                                colors: [
                                                  const Color(0xFF0DD8FF),
                                                  const Color(0xFF0FABFF),
                                                  const Color(0xFF1457FF)
                                                      .withOpacity(0.8),
                                                  const Color(0xFF1636FF),
                                                  const Color(0xFF0E69C7),
                                                ],
                                              ),
                                            )
                                          : BoxDecoration(),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.photo,
                                            color: Theme.of(context).focusColor,
                                            size: 15.0,
                                          ),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            AppLocalizations.instance
                                                .text("loc_photo"),
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context)
                                                            .focusColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        photos = false;
                                        video = true;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      decoration: video
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                                colors: [
                                                  const Color(0xFF0DD8FF),
                                                  const Color(0xFF0FABFF),
                                                  const Color(0xFF1457FF)
                                                      .withOpacity(0.8),
                                                  const Color(0xFF1636FF),
                                                  const Color(0xFF0E69C7),
                                                ],
                                              ),
                                            )
                                          : BoxDecoration(),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.photo,
                                            color: Theme.of(context).focusColor,
                                            size: 15.0,
                                          ),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            AppLocalizations.instance
                                                .text("loc_video"),
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context)
                                                            .focusColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 0.5)),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              AppLocalizations.instance.text("loc_add_review"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      16.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormFieldCustom(
                              onEditComplete: () {
                                reviewFocus.unfocus();
                                // FocusScope.of(context).requestFocus(phoneNumFocus);
                              },
                              radius: 6.0,
                              error: "Enter Full Name",
                              textColor: Theme.of(context).primaryColor,
                              borderColor: Theme.of(context).dividerColor,
                              fillColor: Theme.of(context).focusColor,
                              hintStyle: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      16.0,
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.3),
                                      FontWeight.w500,
                                      'FontRegular'),
                              textStyle: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      16.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                              textInputAction: TextInputAction.next,
                              focusNode: reviewFocus,
                              maxlines: 5,
                              text: '',
                              hintText: "What did you like or dislike?",
                              obscureText: false,
                              textChanged: (value) {},
                              onChanged: () {},
                              suffix: Container(
                                width: 0.0,
                              ),
                              validator: (value) {},
                              enabled: true,
                              textInputType: TextInputType.text,
                              controller: reviewController,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.instance
                                      .text("loc_give_star"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          9.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dialogBackgroundColor
                                                      .withOpacity(0.5),
                                                )),
                                            child: SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "1",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dialogBackgroundColor
                                                      .withOpacity(0.5),
                                                )),
                                            child: SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "2",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dialogBackgroundColor
                                                      .withOpacity(0.5),
                                                )),
                                            child: SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "3",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1.0,
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                              color:
                                                  Theme.of(context).cardColor,
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/images/star.svg",
                                                height: 15.0,
                                                color: Theme.of(context)
                                                    .focusColor),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "4",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dialogBackgroundColor
                                                      .withOpacity(0.5),
                                                )),
                                            child: SvgPicture.asset(
                                              "assets/images/star.svg",
                                              height: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "5",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        9.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      30.0, 10.0, 30.0, 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Theme.of(context).shadowColor,
                                  ),
                                  child: Text(
                                    AppLocalizations.instance
                                        .text("loc_submit"),
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
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        margin: EdgeInsets.only(top: 20.0),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Stack(
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
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
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Refer and get \nfree services",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        18.0,
                                                        Theme.of(context)
                                                            .focusColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            "Invite and get ₹300*",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .focusColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                            textAlign: TextAlign.start,
                                          )
                                        ],
                                      ),
                                      flex: 2,
                                    ),
                                    Flexible(
                                      child: Container(),
                                      flex: 1,
                                    )
                                  ],
                                )),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset("assets/images/gift_1.png"),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                )),
            loading
                ? CustomWidget(context: context).loadingIndicator(
              Theme.of(context).cardColor,
            )
                : Container(),
          ],
        ),
      ),
    );
  }

  servicesDetails() {
    apiUtils
        .getServiceFullDetails(widget.h_id)
        .then((UsersHistoryDetailsModel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;

            OrderFullList = loginData.result!;
            // print(OrderFullList);
            servicename =OrderFullList!.service!.serviceName.toString();
            technicianName = OrderFullList!.technician!.technician!.name.toString();
            technicianNum = OrderFullList!.technician!.technician!.phone.toString();

            var StartTime = DateTime.fromMillisecondsSinceEpoch(int.parse(OrderFullList!.technician!.startTime.toString())*1000);
            var timeStart = "${int.parse(StartTime.toString().substring(11,13))}:${StartTime.toString().substring(14,16)}  ${int.parse(StartTime.toString().substring(11,13))}";
            var EndTime = DateTime.fromMillisecondsSinceEpoch(int.parse(OrderFullList!.technician!.endTime.toString())*1000);
            var timeEnd = "${int.parse(EndTime.toString().substring(11,13))}:${EndTime.toString().substring(14,16)}  ${int.parse(EndTime.toString().substring(11,13))}";
            print(timeStart);
            var DiffTime = EndTime.difference(StartTime).inMinutes;
            diff = DiffTime.toString();
            print(diff.toString()+" hi");

          });
          // CustomWidget(context: context).
          // custombar("Service", loginData.message.toString(), true);

        }
        else {
          loading = false;
          CustomWidget(context: context)
              .custombar("Service", loginData.message.toString(), false);

        }
      });

    }).catchError((Object error) {


      print(error);
      setState(() {
        loading = false;
        // print("jeeva");
      });
    });
  }
}
