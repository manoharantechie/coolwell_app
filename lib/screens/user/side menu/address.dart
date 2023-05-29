import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/custom_widget.dart';
import '../../../common/dotted_line_widget.dart';
import '../../../common/localization/localizations.dart';
import '../../../common/theme/custom_theme.dart';
import '../../../common/ticket_design.dart';
import '../../../data/api_utils.dart';
import '../../../data/model/get_profile_details_model.dart';

class Address_Details_Screen extends StatefulWidget {
  const Address_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Address_Details_Screen> createState() => _Address_Details_ScreenState();
}

class _Address_Details_ScreenState extends State<Address_Details_Screen> {

  APIUtils apiUtils = APIUtils();
  var snackBar;
  ScrollController _scrollController = ScrollController();
  bool loading = false;
  GetProfileResult? details;
  String mobileNo ="";
  String city ="";
  String address ="";
  String userName ="";
  String zip ="";
  List<Address> otherAddressList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading =true;
    addressDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 30.0),
        color: Theme.of(context).focusColor,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                    child: Container(
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
                            AppLocalizations.instance.text("loc_address_detail"),
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
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
               Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: new LinearGradient(
                          colors: [
                            CustomTheme.of(context)
                                .cardColor
                                .withOpacity(0.5),
                            CustomTheme.of(context)
                                .shadowColor
                                .withOpacity(0.5)
                          ],
                          begin: Alignment.center,
                          end: Alignment.topRight,
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          userName.toString(),
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              14.0,
                              Theme.of(
                                  context)
                                  .focusColor,
                              FontWeight
                                  .w600,
                              'FontRegular'),
                          textAlign:
                          TextAlign
                              .start,
                          overflow:
                          TextOverflow
                              .ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          AppLocalizations.instance
                              .text("loc_address")+" :",
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              18.0,
                              Theme.of(
                                  context)
                                  .focusColor,
                              FontWeight
                                  .w600,
                              'FontRegular'),
                          textAlign:
                          TextAlign
                              .start,
                          overflow:
                          TextOverflow
                              .ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                address.toString(),
                                style: CustomWidget(context: context).CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(
                                        context)
                                        .focusColor,
                                    FontWeight
                                        .w600,
                                    'FontRegular'),
                                textAlign:
                                TextAlign
                                    .start,
                                overflow:
                                TextOverflow
                                    .ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              city.toString(),
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(
                                      context)
                                      .focusColor,
                                  FontWeight
                                      .w600,
                                  'FontRegular'),
                              textAlign:
                              TextAlign
                                  .start,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              zip.toString(),
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(
                                      context)
                                      .focusColor,
                                  FontWeight
                                      .w600,
                                  'FontRegular'),
                              textAlign:
                              TextAlign
                                  .start,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              mobileNo.toString(),
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(
                                      context)
                                      .focusColor,
                                  FontWeight
                                      .w600,
                                  'FontRegular'),
                              textAlign:
                              TextAlign
                                  .start,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            // otherAddressList.length>0 ?
            Padding(padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.37),
              child: otherAddressList.length >0 ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: otherAddressList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: new LinearGradient(
                              colors: [
                                CustomTheme.of(context)
                                    .cardColor
                                    .withOpacity(0.5),
                                CustomTheme.of(context)
                                    .shadowColor
                                    .withOpacity(0.5)
                              ],
                              begin: Alignment.center,
                              end: Alignment.topRight,
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            const SizedBox(
                              height: 15.0,
                            ),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 AppLocalizations.instance
                                     .text("loc_address")+" :",
                                 style: CustomWidget(context: context).CustomSizedTextStyle(
                                     18.0,
                                     Theme.of(
                                         context)
                                         .focusColor,
                                     FontWeight
                                         .w600,
                                     'FontRegular'),
                                 textAlign:
                                 TextAlign
                                     .start,
                                 overflow:
                                 TextOverflow
                                     .ellipsis,
                               ),
                               Container(
                                 padding: EdgeInsets.all(5.0),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5.0),
                                   color: CustomTheme.of(context)
                                       .cardColor
                                       .withOpacity(0.5),
                                 ),
                                 child: Text(
                                   "Others",
                                   style: CustomWidget(context: context).CustomSizedTextStyle(
                                       10.0,
                                       Theme.of(
                                           context)
                                           .focusColor,
                                       FontWeight
                                           .w600,
                                       'FontRegular'),
                                   textAlign:
                                   TextAlign
                                       .start,
                                   overflow:
                                   TextOverflow
                                       .ellipsis,
                                 ),
                               )
                             ],
                           ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    otherAddressList[index].address.toString(),
                                    style: CustomWidget(context: context).CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(
                                            context)
                                            .focusColor,
                                        FontWeight
                                            .w600,
                                        'FontRegular'),
                                    textAlign:
                                    TextAlign
                                        .start,
                                    overflow:
                                    TextOverflow
                                        .ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  otherAddressList[index].city.toString(),
                                  style: CustomWidget(context: context).CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(
                                          context)
                                          .focusColor,
                                      FontWeight
                                          .w600,
                                      'FontRegular'),
                                  textAlign:
                                  TextAlign
                                      .start,
                                  overflow:
                                  TextOverflow
                                      .ellipsis,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  otherAddressList[index].zip.toString(),
                                  style: CustomWidget(context: context).CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(
                                          context)
                                          .focusColor,
                                      FontWeight
                                          .w600,
                                      'FontRegular'),
                                  textAlign:
                                  TextAlign
                                      .start,
                                  overflow:
                                  TextOverflow
                                      .ellipsis,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),

                    ],
                  );
                },
              )
                :
            loading
                ? CustomWidget(context: context).loadingIndicator(
              Theme.of(context).cardColor,
            )
                : Container(),
            ),)
          ],
        ),
      ),
    );
  }

  addressDetails() {
    apiUtils
        .getProfileDetails()
        .then((GetProfileDetailsModel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;
            details = loginData.result!;
            userName=details!.name.toString();
            mobileNo=details!.phone.toString();
            address=details!.addressHome!.address.toString();
            city=details!.addressHome!.city.toString();
            zip=details!.addressHome!.zip.toString();
            mobileNo=details!.phone.toString();
            otherAddressList = details!.addressOther!;

          });
          // CustomWidget(context: context).
          // custombar("Profile", loginData.message.toString(), true);

        }
        else {
          loading = false;
          CustomWidget(context: context)
              .custombar("Profile", loginData.message.toString(), false);

        }
      });

    }).catchError((Object error) {


      print(error);
      setState(() {
        loading = false;
      });
    });
  }

}
