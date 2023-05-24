import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coolwell_app/common/calendar/calendar_timeline.dart';
import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'location_Screen.dart';

class Slot_Screen extends StatefulWidget {
  const Slot_Screen({Key? key}) : super(key: key);

  @override
  State<Slot_Screen> createState() => _Slot_ScreenState();
}

class _Slot_ScreenState extends State<Slot_Screen> {

  late DateTime _selectedDate;
  bool time = false;
  bool loading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = DateTime.now().add(const Duration(days: 0));
    bool loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/slot_back.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                          Navigator.of(context).pop();
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
                              .text("loc_schedule_slot"),
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
                  // const SizedBox(height: 20.0,),

                  Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 18.0,
                          color:  Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 8.0,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "Home - 2/22, Address...",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),flex: 2,),
            Flexible(child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15.0,),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.instance
                                  .text("loc_slot_txt1"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  18.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10.0,),
                            Text(
                              AppLocalizations.instance
                                  .text("loc_slot_txt2"),
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
                      const SizedBox(height: 10.0,),
                      Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                          ),
                          padding: EdgeInsets.only(left: 20.0),
                          child: Calen()),

                      const SizedBox(height: 15.0,),

                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                          decoration: BoxDecoration(
                            color:  Theme.of(context).dialogBackgroundColor. withOpacity(0.3),
                          ),
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 2.0),child: Icon(
                                Icons.calendar_month_outlined,
                                size: 18.0,
                                color:  Theme.of(context).dialogBackgroundColor,
                              ),),
                              SizedBox(width: 12.0,),
                              Flexible(
                                child: Text(
                                  AppLocalizations.instance
                                      .text("loc_slot_txt3"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      10.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                              )
                            ],
                          )
                      ),
                      const SizedBox(height: 20.0,),
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.instance
                                  .text("loc_slot_txt_service"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  18.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 20.0,),
                            Container(
                              color: Theme.of(context).focusColor,
                              height: 30.0,
                              child:  ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                controller: _scrollController,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6.0),
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                            colors: [
                                              const Color(0xFF0DD8FF).withOpacity(0.3),
                                              const Color(0xFF0FABFF).withOpacity(0.3),
                                              const Color(0xFF1457FF).withOpacity(0.3),
                                              const Color(0xFF1636FF).withOpacity(0.3),
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "10:30 AM",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                          ),
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
                    ],
                  ),


                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Location_Screen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),color: Theme.of(context).shadowColor,
                        ),
                        child: Text(
                          AppLocalizations.instance
                              .text("loc_prceed_select_loc"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).focusColor,
                              FontWeight.w800,
                              'FontRegular'),
                          textAlign: TextAlign.center
                          ,
                        ),
                      ),
                    ),
                  )


                ],
              ),

            ),flex: 8,)
          ],
        ),
      ),
    );
  }

  Widget Calen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CalendarTimeline(
          showYears: false,
          initialDate: _selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            setState(() {
              _selectedDate = date;
              loading = true;

            });
          },
          leftMargin: 0,
          monthColor: Colors.grey,
          dayColor: Theme.of(context).primaryColor,
          dayNameColor: Theme.of(context).focusColor,
          activeDayColor: Colors.black,
          activeBackgroundDayColor: Theme.of(context).cardColor,
          dotsColor: const Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en',
        ),
      ],
    );
  }
}
