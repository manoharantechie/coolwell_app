
import 'package:coolwell_app/screens/user/service/service_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/dotted_line_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:coolwell_app/common/textformfield_custom.dart';

import '../../../data/api_utils.dart';
import '../../../data/model/get_services_details.dart';
import '../../../data/model/get_user_service_categroy_model.dart';
import '../profile/slot_screen.dart';

class Service_Screen extends StatefulWidget {
  const Service_Screen({Key? key}) : super(key: key);

  @override
  State<Service_Screen> createState() => _Service_ScreenState();
}

class _Service_ScreenState extends State<Service_Screen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServicesDetaile();
    loading = true;
  }

  APIUtils apiUtils = APIUtils();
  bool loading = false;
  bool add = false;


  ScrollController _scrollController = ScrollController();
  ScrollController controller = ScrollController();
  List<GetServiceResult> totalDetails = [];
  List<GetUserServiceResult> totalService = [];
  List<GetServiceCategory> categoryDetails = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [
             Container(
               color: Theme.of(context).backgroundColor,
               child: Column(
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height * 0.26,
                     padding: EdgeInsets.only(top: 20.0),
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

                               SizedBox(width: 20.0,),
                               InkWell(
                                 onTap: (){

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
                           const SizedBox(height: 50.0,),
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
                     color: Theme.of(context).backgroundColor,
                     padding: EdgeInsets.only(left: 20.0),
                     height: 85.0,
                     child:  ListView.builder(
                       itemCount: 2,
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
                                         // totalDetails[index].notes!.toString(),
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
        totalService.length >0 ? Container(
              color: Theme.of(context).backgroundColor,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.41),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: Container(
                      color: Theme.of(context).backgroundColor,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: totalService.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          controller: controller,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                    });
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            Service_Details_Screen(S_id: totalService[index].id.toString() )));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height *0.22,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          // image: AssetImage("assets/images/services.png",),
                                          image: NetworkImage(totalService[index].image.toString(),),
                                          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),

                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                                decoration: BoxDecoration(
                                                  color:  Theme.of(context).shadowColor,
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(6.0),
                                                      bottomRight: Radius.circular(6.0)),
                                                ),
                                                child: Text(
                                                  // "15% OFF",
                                                  totalService[index].offer.toString()+ " Off".toUpperCase(),
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

                                            Text(
                                              // "Services",
                                              totalService[index].name.toString(),
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  20.0,
                                                  Theme.of(context).focusColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.end,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     Navigator.of(context).push(MaterialPageRoute(
                                //         builder: (context) =>
                                //             Service_Details_Screen(S_name: totalDetails[index]
                                //                 .serviceName
                                //                 .toString(),S_amount: totalDetails[index].amount.toString(),S_time: totalDetails[
                                //             index]
                                //                 .time!
                                //                 .toString(),Offer:  totalDetails[index]
                                //                 .category!
                                //                 .offer!
                                //                 .toString(), P_offerText: totalDetails[index]
                                //                 .notes!
                                //                 .toString(), T_details:  totalDetails[index]
                                //                 .checkList![
                                //             index]
                                //                 .toString() )));
                                //   },
                                //   child: Container(
                                //     width:
                                //     MediaQuery.of(context).size.width,
                                //     height: MediaQuery.of(context)
                                //         .size
                                //         .height *
                                //         0.24,
                                //     decoration: BoxDecoration(
                                //       image: DecorationImage(
                                //         image: AssetImage("assets/images/services.png",),
                                //         fit: BoxFit.cover,
                                //       ),
                                //       borderRadius: BorderRadius.circular(10.0),
                                //
                                //     ),
                                //     child: Row(
                                //       children: [
                                //         Flexible(
                                //           child: Container(
                                //             padding: EdgeInsets.fromLTRB(
                                //                 15, 15.0, 15.0, 15.0),
                                //             decoration: BoxDecoration(
                                //               borderRadius:
                                //               BorderRadius.only(
                                //                 topLeft:
                                //                 Radius.circular(6.0),
                                //                 bottomLeft:
                                //                 Radius.circular(6.0),
                                //               ),
                                //               // color: Theme.of(context)
                                //               //     .focusColor,
                                //             ),
                                //             child: Column(
                                //               crossAxisAlignment:
                                //               CrossAxisAlignment
                                //                   .start,
                                //               children: [
                                //                 Text(
                                //                   // AppLocalizations.instance
                                //                   //     .text("loc_cleaning"),
                                //                   // totalDetails[index]
                                //                   //     .serviceName
                                //                   //     .toString(),
                                //                   totalService[index].name.toString(),
                                //                   style: CustomWidget(
                                //                       context:
                                //                       context)
                                //                       .CustomSizedTextStyle(
                                //                       18.0,
                                //                       Theme.of(
                                //                           context)
                                //                           .primaryColor,
                                //                       FontWeight.w600,
                                //                       'FontRegular'),
                                //                   textAlign:
                                //                   TextAlign.center,
                                //                 ),
                                //                 SizedBox(
                                //                   height: 5.0,
                                //                 ),
                                //                 Row(
                                //                   crossAxisAlignment:
                                //                   CrossAxisAlignment
                                //                       .center,
                                //                   children: [
                                //                     Icon(
                                //                       Icons.star,
                                //                       size: 15.0,
                                //                       color: Theme.of(
                                //                           context)
                                //                           .cardColor,
                                //                     ),
                                //                     SizedBox(
                                //                       width: 5.0,
                                //                     ),
                                //                     Text(
                                //                       "4.81 (1.2M)",
                                //                       style: CustomWidget(
                                //                           context:
                                //                           context)
                                //                           .CustomSizedTextStyle(
                                //                           10.0,
                                //                           Theme.of(
                                //                               context)
                                //                               .primaryColor,
                                //                           FontWeight
                                //                               .w400,
                                //                           'FontRegular'),
                                //                       textAlign: TextAlign
                                //                           .center,
                                //                     ),
                                //                   ],
                                //                 ),
                                //                 SizedBox(
                                //                   height: 5.0,
                                //                 ),
                                //                 Row(
                                //                   children: [
                                //                     Flexible(
                                //                         child: Row(
                                //                           crossAxisAlignment:
                                //                           CrossAxisAlignment
                                //                               .center,
                                //                           mainAxisAlignment:
                                //                           MainAxisAlignment
                                //                               .start,
                                //                           children: [
                                //                             Text(
                                //                               // "₹499",
                                //                               "₹" +
                                //                                   totalDetails[
                                //                                   index]
                                //                                       .amount!
                                //                                       .toString(),
                                //                               style: CustomWidget(
                                //                                   context:
                                //                                   context)
                                //                                   .CustomSizedTextStyle(
                                //                                   13.0,
                                //                                   Theme.of(context)
                                //                                       .primaryColor,
                                //                                   FontWeight
                                //                                       .w800,
                                //                                   'FontRegular'),
                                //                               textAlign:
                                //                               TextAlign
                                //                                   .center,
                                //                             ),
                                //                             SizedBox(
                                //                               width: 10.0,
                                //                             ),
                                //                             Container(
                                //                               height: 12.0,
                                //                               width: 1.0,
                                //                               color: Theme.of(
                                //                                   context)
                                //                                   .dialogBackgroundColor,
                                //                             ),
                                //                             SizedBox(
                                //                               width: 10.0,
                                //                             ),
                                //                             Text(
                                //                               "₹649",
                                //                               style: TextStyle(
                                //                                   fontSize:
                                //                                   10.0,
                                //                                   decoration:
                                //                                   TextDecoration
                                //                                       .lineThrough,
                                //                                   fontWeight:
                                //                                   FontWeight
                                //                                       .w600,
                                //                                   color: Theme.of(
                                //                                       context)
                                //                                       .dialogBackgroundColor,
                                //                                   fontStyle:
                                //                                   FontStyle
                                //                                       .normal),
                                //                               textAlign:
                                //                               TextAlign
                                //                                   .center,
                                //                             ),
                                //                           ],
                                //                         )),
                                //                     Flexible(
                                //                         child: Row(
                                //                           crossAxisAlignment:
                                //                           CrossAxisAlignment
                                //                               .center,
                                //                           children: [
                                //                             Container(
                                //                               decoration:
                                //                               BoxDecoration(
                                //                                 shape: BoxShape
                                //                                     .circle,
                                //                                 color: Theme.of(
                                //                                     context)
                                //                                     .primaryColor,
                                //                               ),
                                //                               width: 2.0,
                                //                               height: 2.0,
                                //                             ),
                                //                             SizedBox(
                                //                               width: 5.0,
                                //                             ),
                                //                             Text(
                                //                               // "45 mins",
                                //                               totalDetails[
                                //                               index]
                                //                                   .time!
                                //                                   .toString(),
                                //                               style: CustomWidget(
                                //                                   context:
                                //                                   context)
                                //                                   .CustomSizedTextStyle(
                                //                                   10.0,
                                //                                   Theme.of(context)
                                //                                       .primaryColor,
                                //                                   FontWeight
                                //                                       .w400,
                                //                                   'FontRegular'),
                                //                               textAlign:
                                //                               TextAlign
                                //                                   .center,
                                //                             ),
                                //                           ],
                                //                         ))
                                //                   ],
                                //                 ),
                                //                 SizedBox(
                                //                   height: 10.0,
                                //                 ),
                                //                 Container(
                                //                   height: 1.0,
                                //                   color: Theme.of(context)
                                //                       .dialogBackgroundColor,
                                //                 ),
                                //                 SizedBox(
                                //                   height: 10.0,
                                //                 ),
                                //                 Row(
                                //                   crossAxisAlignment:
                                //                   CrossAxisAlignment
                                //                       .start,
                                //                   children: [
                                //                     Image.asset(
                                //                         "assets/images/tag.png"),
                                //                     SizedBox(
                                //                       width: 5.0,
                                //                     ),
                                //                     Text(
                                //                       // "30% off 2nd item onwards",
                                //                       totalDetails[index]
                                //                           .notes!
                                //                           .toString(),
                                //                       style: CustomWidget(
                                //                           context:
                                //                           context)
                                //                           .CustomSizedTextStyle(
                                //                           10.0,
                                //                           Theme.of(
                                //                               context)
                                //                               .primaryColor,
                                //                           FontWeight
                                //                               .w400,
                                //                           'FontRegular'),
                                //                       textAlign: TextAlign
                                //                           .center,
                                //                     ),
                                //                   ],
                                //                 ),
                                //                 SizedBox(
                                //                   height: 10.0,
                                //                 ),
                                //                 DottedLine(
                                //                   dashColor:
                                //                   Theme.of(context)
                                //                       .dialogBackgroundColor,
                                //                 ),
                                //                 SizedBox(
                                //                   height: 10.0,
                                //                 ),
                                //                 Row(
                                //                   children: [
                                //                     Container(
                                //                       width: 2.0,
                                //                       height: 2.0,
                                //                       decoration:
                                //                       BoxDecoration(
                                //                         shape: BoxShape
                                //                             .circle,
                                //                         color: Theme.of(
                                //                             context)
                                //                             .selectedRowColor,
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                       width: 5.0,
                                //                     ),
                                //                     Text(
                                //                       // "Get 2x deeper dust removel with unique technology",
                                //                       totalDetails[index]
                                //                           .checkList![
                                //                       index]
                                //                           .toString(),
                                //                       style: CustomWidget(
                                //                           context:
                                //                           context)
                                //                           .CustomSizedTextStyle(
                                //                           7.0,
                                //                           Theme.of(
                                //                               context)
                                //                               .primaryColor,
                                //                           FontWeight
                                //                               .w400,
                                //                           'FontRegular'),
                                //                       textAlign: TextAlign
                                //                           .center,
                                //                     ),
                                //                   ],
                                //                 ),
                                //                 Row(
                                //                   children: [
                                //                     Container(
                                //                       width: 2.0,
                                //                       height: 2.0,
                                //                       decoration:
                                //                       BoxDecoration(
                                //                         shape: BoxShape
                                //                             .circle,
                                //                         color: Theme.of(
                                //                             context)
                                //                             .selectedRowColor,
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                       width: 5.0,
                                //                     ),
                                //                     Text(
                                //                       // "Get 2x deeper dust removel with unique technology",
                                //                       totalDetails[index]
                                //                           .checkList![
                                //                       index]
                                //                           .toString(),
                                //                       style: CustomWidget(
                                //                           context:
                                //                           context)
                                //                           .CustomSizedTextStyle(
                                //                           7.0,
                                //                           Theme.of(
                                //                               context)
                                //                               .primaryColor,
                                //                           FontWeight
                                //                               .w400,
                                //                           'FontRegular'),
                                //                       textAlign: TextAlign
                                //                           .center,
                                //                     ),
                                //                   ],
                                //                 ),
                                //                 SizedBox(
                                //                   height: 5.0,
                                //                 ),
                                //                 GestureDetector(
                                //                   onTap: () {
                                //                     // Navigator.of(context).push(
                                //                     //     MaterialPageRoute(
                                //                     //         builder:
                                //                     //             (context) =>
                                //                     //             Service_Details_Screen()));
                                //                   },
                                //                   child: Text(
                                //                     AppLocalizations
                                //                         .instance
                                //                         .text(
                                //                         "loc_view_details"),
                                //                     style: CustomWidget(
                                //                         context:
                                //                         context)
                                //                         .CustomSizedTextStyle(
                                //                         8.0,
                                //                         Theme.of(
                                //                             context)
                                //                             .shadowColor,
                                //                         FontWeight
                                //                             .w400,
                                //                         'FontRegular'),
                                //                     textAlign:
                                //                     TextAlign.center,
                                //                   ),
                                //                 )
                                //               ],
                                //             ),
                                //           ),
                                //           flex: 2,
                                //         ),
                                //         Flexible(
                                //           child: Container(
                                //             width: MediaQuery.of(context)
                                //                 .size
                                //                 .width,
                                //             padding: EdgeInsets.fromLTRB(
                                //                 10, 15.0, 10.0, 15.0),
                                //             decoration: BoxDecoration(
                                //               // image: DecorationImage(
                                //               //   image: AssetImage(
                                //               //       "assets/images/cleaning.png"),
                                //               //   // image: NetworkImage("http://164.92.128.14:5000/images/1681825904905_dikin.png"),
                                //               //   // image: NetworkImage(totalDetails[index].coverImage![index].toString()),
                                //               //   fit: BoxFit.cover,
                                //               // ),
                                //               borderRadius:
                                //               BorderRadius.only(
                                //                 topRight:
                                //                 Radius.circular(6.0),
                                //                 bottomRight:
                                //                 Radius.circular(6.0),
                                //               ),
                                //               // color: Theme.of(context)
                                //               //     .focusColor,
                                //             ),
                                //             child: Column(
                                //               crossAxisAlignment:
                                //               CrossAxisAlignment
                                //                   .center,
                                //               mainAxisAlignment:
                                //               MainAxisAlignment
                                //                   .spaceBetween,
                                //               children: [
                                //                 Align(
                                //                   alignment:
                                //                   Alignment.topRight,
                                //                   child: Container(
                                //                     padding: EdgeInsets
                                //                         .fromLTRB(5, 5.0,
                                //                         5.0, 5.0),
                                //                     decoration:
                                //                     BoxDecoration(
                                //                       borderRadius:
                                //                       BorderRadius
                                //                           .circular(
                                //                           6.0),
                                //                       color: Theme.of(
                                //                           context)
                                //                           .shadowColor,
                                //                     ),
                                //                     child: Text(
                                //                       // "61% OFF",
                                //                       // totalDetails[index]
                                //                       //     .category!
                                //                       //     .offer!
                                //                       //     .toString() +
                                //                       //     " OFF",
                                //                       totalService[index].offer.toString() + " Off",
                                //                       style: CustomWidget(
                                //                           context:
                                //                           context)
                                //                           .CustomSizedTextStyle(
                                //                           14.0,
                                //                           Theme.of(
                                //                               context)
                                //                               .focusColor,
                                //                           FontWeight
                                //                               .w800,
                                //                           'FontRegular'),
                                //                       textAlign:
                                //                       TextAlign.end,
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 InkWell(
                                //                   onTap: () {
                                //                     setState(() {
                                //                       add = true;
                                //                     });
                                //                     // if (index==0){
                                //                     //   Navigator.of(context).push(MaterialPageRoute(
                                //                     //       builder: (context) =>
                                //                     //           Payment_Summary_Screen()));
                                //                     // } else if (index==1){
                                //                     //   // Navigator.of(context).push(MaterialPageRoute(
                                //                     //   //     builder: (context) =>
                                //                     //   //         DashBoard_Screen()));
                                //                     // }
                                //                   },
                                //                   child: Container(
                                //                     margin:
                                //                     EdgeInsets.only(
                                //                         bottom: 10.0),
                                //                     width: MediaQuery.of(
                                //                         context)
                                //                         .size
                                //                         .width *
                                //                         0.15,
                                //                     padding: EdgeInsets
                                //                         .fromLTRB(
                                //                         0.0,
                                //                         5.0,
                                //                         0.0,
                                //                         5.0),
                                //                     decoration:
                                //                     BoxDecoration(
                                //                       borderRadius:
                                //                       BorderRadius
                                //                           .circular(
                                //                           15.0),
                                //                       gradient:
                                //                       LinearGradient(
                                //                         begin: Alignment
                                //                             .topLeft,
                                //                         end: Alignment
                                //                             .bottomRight,
                                //                         colors: [
                                //                           const Color(
                                //                               0xFF0DD8FF),
                                //                           const Color(
                                //                               0xFF0FABFF),
                                //                           const Color(
                                //                               0xFF1457FF),
                                //                           const Color(
                                //                               0xFF1636FF),
                                //                           const Color(
                                //                               0xFF0E69C7),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                     child: Row(
                                //                       crossAxisAlignment:
                                //                       CrossAxisAlignment
                                //                           .center,
                                //                       mainAxisAlignment:
                                //                       MainAxisAlignment
                                //                           .center,
                                //                       children: [
                                //                         SvgPicture.asset(
                                //                           "assets/images/tools.svg",
                                //                           color: Theme.of(
                                //                               context)
                                //                               .focusColor,
                                //                           height: 15.0,
                                //                         ),
                                //                         SizedBox(
                                //                           width: 5.0,
                                //                         ),
                                //                         Text(
                                //                           AppLocalizations
                                //                               .instance
                                //                               .text(
                                //                               "loc_add"),
                                //                           style: CustomWidget(
                                //                               context:
                                //                               context)
                                //                               .CustomSizedTextStyle(
                                //                               10.0,
                                //                               Theme.of(context)
                                //                                   .focusColor,
                                //                               FontWeight
                                //                                   .w600,
                                //                               'FontRegular'),
                                //                           textAlign:
                                //                           TextAlign
                                //                               .center,
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 )
                                //               ],
                                //             ),
                                //           ),
                                //           flex: 1,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            );
                          },
                        )
                      ))),
            ):
        loading
            ? CustomWidget(context: context).loadingIndicator(
          Theme.of(context).cardColor,
        ) : Container(
            child:
            Center(
              child: Text(
                AppLocalizations.instance.text('loc_no_records'),
                style: CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    16.0,
                    Theme.of(context).primaryColor,
                    FontWeight.w700,
                    'FontRegular'),
              ),
            )
        )
            // add ?Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     margin: EdgeInsets.only(left: 35.0, right: 35.0 , bottom: 30.0),
            //     width: MediaQuery.of(context).size.width,
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         InkWell(
            //           onTap:(){
            //
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width * 0.5,
            //             padding: EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 13.0),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(30.0),
            //               color: Theme.of(context).primaryColor,
            //             ),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(15.0),
            //                     gradient: LinearGradient(
            //                       begin: Alignment.topLeft,
            //                       end: Alignment.bottomRight,
            //                       colors: [
            //                         const Color(0xFF0DD8FF),
            //                         const Color(0xFF0FABFF),
            //                         const Color(0xFF1457FF),
            //                         const Color(0xFF1636FF),
            //                         const Color(0xFF0E69C7),
            //                       ],
            //                     ),
            //                   ),
            //                   child: Row(
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       SvgPicture.asset(
            //                         "assets/images/tools.svg",
            //                         color: Theme.of(context).focusColor, height: 15.0,),
            //                       SizedBox(width: 5.0,),
            //                       Text(
            //                         AppLocalizations.instance
            //                             .text("loc_service"),
            //                         style: CustomWidget(context: context)
            //                             .CustomSizedTextStyle(
            //                             10.0,
            //                             Theme.of(context).focusColor,
            //                             FontWeight.w600,
            //                             'FontRegular'),
            //                         textAlign: TextAlign.center,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 Text(
            //                   "₹"+"499",
            //                   style: CustomWidget(context: context)
            //                       .CustomSizedTextStyle(
            //                       14.0,
            //                       Theme.of(context).focusColor,
            //                       FontWeight.w600,
            //                       'FontRegular'),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SizedBox(width: 10.0,),
            //         InkWell(
            //           onTap:(){
            //             setState(() {
            //               // viewDetails();
            //             });
            //           },
            //           child: Container(
            //             padding: EdgeInsets.fromLTRB(25.0, 13.0, 25.0, 13.0),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(30.0),
            //               color: Theme.of(context).shadowColor,
            //             ),
            //             child: Text(
            //               AppLocalizations.instance
            //                   .text("loc_view_cart"),
            //               style: CustomWidget(context: context)
            //                   .CustomSizedTextStyle(
            //                   14.0,
            //                   Theme.of(context).focusColor,
            //                   FontWeight.w600,
            //                   'FontRegular'),
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         )
            //
            //       ],
            //     ),
            //   ),
            // ): Container(),
          ],
        )
      ),
    );
  }



  getServicesDetaile() {
    apiUtils.getUserService().then((GetUserServiceCategoryModel Details) {
      if (Details.success!) {
        setState(() {
          totalService = Details.result!;
          loading = false;
        });

      } else {
        setState(() {
          loading = false;
          CustomWidget(context: context)
              .custombar("Service", Details.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }

}

