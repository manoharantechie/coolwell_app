import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Payment_Summary_Screen extends StatefulWidget {
  const Payment_Summary_Screen({Key? key}) : super(key: key);

  @override
  State<Payment_Summary_Screen> createState() => _Payment_Summary_ScreenState();
}

class _Payment_Summary_ScreenState extends State<Payment_Summary_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 50.0),
        color: Theme.of(context).focusColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 20.0,right: 20.0),
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
                               const Color(0xFFE8E8E8),
                               const Color(0xFFF4F4F4).withOpacity(0.5),
                             ],
                           ),
                         ),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             InkWell(
                               onTap:(){
                                 // Navigator.pop(context);
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
                       SizedBox(height: 15.0,),
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
                 SizedBox(height: 10.0,),
                 Container(
                   height: 1.0,
                   color: Theme.of(context).accentColor,
                 ),
                 SizedBox(height: 10.0,),
                 Padding(padding: EdgeInsets.only(left: 20.0, right: 20.0),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
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
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           InkWell(
                             onTap:(){
                             },
                             child: Container(
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
                                   Container(
                                     child: Center(
                                       child: Icon(
                                         Icons.minimize,
                                         color: Theme.of(context).primaryColor,
                                         size: 15.0,
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5.0,),
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
                                   SizedBox(width: 5.0,),
                                   Container(
                                     child: Center(
                                       child: Icon(
                                         Icons.add,
                                         color: Theme.of(context).primaryColor,
                                         size: 15.0,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Column(
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
                 )
               ],
             ),
           )
          ],
        ),
      )
    );
  }
}
