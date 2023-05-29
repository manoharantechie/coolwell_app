import 'package:coolwell_app/data/model/get_services_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coolwell_app/common/calendar/calendar_timeline.dart';
import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:intl/intl.dart';
import '../../../data/api_utils.dart';
import '../../../data/model/get_service_time_model.dart';
import '../service/service_location.dart';

class Slot_Screen extends StatefulWidget {
 GetServiceResult addedServiceDetails;

   Slot_Screen({Key? key,  required this.addedServiceDetails,}) : super(key: key);

  @override
  State<Slot_Screen> createState() => Slot_ScreenState();
}

class Slot_ScreenState extends State<Slot_Screen> {

  APIUtils apiUtils = APIUtils();
  bool loading = false;
  late DateTime _selectedDate;
  bool time = false;
  final ScrollController _scrollController = ScrollController();
  // late String _timeString;
  // late String _updateTime;
  String startTime= "";
  String selectedDate= "";
  String endTime= "";
  GetServiceTimeResult? serviceTimes;
  List<String> timeList=[];

  int selIndex=-1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServicesTimeDetails();
    _selectedDate = DateTime.now().add(const Duration(days: 0));
    DateFormat formatter=DateFormat("MM/dd/yyyy");
    selectedDate=formatter.format(DateTime.now());

    // Timer.periodic(Duration(seconds:1), (Timer t)=>_getCurrentTime());
    // _timeString = "${DateTime.now().hour} : ${DateTime.now().minute}  ${DateTime.now().hour>= 12 ? "PM" : "AM"}";
    // _updateTime = "${DateTime.now().hour+ 1} : ${DateTime.now().minute}  ${DateTime.now().hour>= 12 ? "PM" : "AM"}";
    loading = true;

    // for(_timeString= "${DateTime.now().hour} : ${DateTime.now().minute}  ${DateTime.now().hour>= 12 ? "PM" : "AM"}"; _timeString < _updateTime; _timeString++1){
    //
    // }
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0, bottom: 10.0),
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
                                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
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
                            const SizedBox(width: 20.0,),
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
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              size: 18.0,
                              color:  Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 8.0,),
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
                Flexible( child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: const BorderRadius.only(
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
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                              padding: const EdgeInsets.only(left: 20.0),
                              child: calen()),

                          const SizedBox(height: 15.0,),

                          Container(
                              margin: const EdgeInsets.only(left: 20.0),
                              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                              decoration: BoxDecoration(
                                  color:  Theme.of(context).dialogBackgroundColor. withOpacity(0.3),
                                  borderRadius: const BorderRadius.only(
                                    topLeft:  Radius.circular(5.0),
                                    bottomLeft:  Radius.circular(5.0),
                                  )
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: const EdgeInsets.only(top: 2.0),child: Icon(
                                    Icons.calendar_month_outlined,
                                    size: 18.0,
                                    color:  Theme.of(context).dialogBackgroundColor,
                                  ),),
                                  const SizedBox(width: 12.0,),
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
                            margin: const EdgeInsets.only(left: 20.0),
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
                                    itemCount: timeList.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    controller: _scrollController,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Row(
                                        children: [
                                    InkWell(
                                            onTap:(){
                                              setState(() {
                                                selIndex=index;
                                              });
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.22,
                                              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                              decoration: index==selIndex ? BoxDecoration(
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
                                              ): BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6.0),
                                                  border: Border.all(width: 1.0,color: Theme.of(context).dividerColor,),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Theme.of(context).dividerColor.withOpacity(0.3),
                                                        blurRadius: 10.0,
                                                        offset: const Offset(0.0, 0.5)
                                                    ),
                                                  ]
                                              ),
                                              child: Center(
                                                child: Text(
                                                 timeList[index],
                                                  style: CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                      12.0,
                                                      Theme.of(context).primaryColor,
                                                      FontWeight.w500,
                                                      'FontRegular'),
                                                ),
                                              ),
                                            ),
                                          ) ,

                                          const SizedBox(width: 15.0,)
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
                            if(selIndex>=0) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Add_Service_Location_Screen(
                                          addedServiceDetails:widget.addedServiceDetails,
                                            serv_Date: selectedDate,
                                            serv_Time:timeList[selIndex] ,
                                          )));
                            } else{
                              loading = false;
                              CustomWidget(context: context)
                                  .custombar("Schedule slot", "Please select service time", false);
                            }
                            },

                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
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

  Widget calen() {
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
              timeList=[];
              selIndex=-1;
              DateFormat formatter=DateFormat("MM/dd/yyyy");
              selectedDate=formatter.format(date);
              _selectedDate = date;
              DateTime current=DateTime.now();
              if(current.compareTo(_selectedDate) < 0){
                String tt=DateTime.now().hour.toString();

                int start=int.parse(serviceTimes!.startTime.toString().split(":")[0]);
                String startpoint=start.toString();


                for(int m= int.parse(startpoint);m<=int.parse(endTime);m++)
                {
                  timeList.add(m.toString()+":00");
                }
              }
              else{
                String tt=DateTime.now().hour.toString();

                int start=int.parse(serviceTimes!.startTime.toString().split(":")[0]);
                String startpoint="";
                if(int.parse(tt)>start)
                {
                  startpoint=tt;
                }
                else
                {
                  startpoint=start.toString();
                }

                for(int m= int.parse(startpoint);m<=int.parse(endTime);m++)
                {
                  timeList.add(m.toString()+":00");
                }
              }



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

  // void _getCurrentTime()  {
  //   setState(() {
  //     _timeString = "${DateTime.now().hour} : ${DateTime.now().minute}  ${DateTime.now().hour>= 12 ? "PM" : "AM"} ";
  //   });
  // }



  getServicesTimeDetails() {
    apiUtils.getServiceTime().then((GetServiceTimeModel details) {
      if (details.success!) {
        setState(() {
          serviceTimes = details.result!;
          startTime = serviceTimes!.startTime.toString();
          print(serviceTimes!.endTime.toString());

          endTime = (12+int.parse(serviceTimes!.endTime.toString().split(":")[0])).toString();
          String tt=DateTime.now().hour.toString();

          int start=int.parse(serviceTimes!.startTime.toString().split(":")[0]);
          String startpoint="";
          if(int.parse(tt)>start)
            {
              startpoint=tt;
            }
          else
            {
              startpoint=start.toString();
            }
          print(endTime);

          for(int m= int.parse(startpoint);m<=int.parse(endTime);m++)
            {
              timeList.add(m.toString()+":00");
            }

          loading = false;
        });

      } else {
        setState(() {
          loading = false;
          CustomWidget(context: context)
              .custombar("Service", details.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }



}
