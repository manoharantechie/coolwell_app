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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).splashColor,
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFF4F4F4),
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
