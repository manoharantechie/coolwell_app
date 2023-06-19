import 'package:coolwell_app/data/model/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/custom_switch.dart';
import '../../../common/custom_widget.dart';
import '../../../common/dotted_line_widget.dart';
import '../../../common/localization/localizations.dart';
import '../../../common/textformfield_custom.dart';
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
  ScrollController controller = ScrollController();
  bool loading = false;
  GetProfileResult? details;
  String mobileNo ="";
  String city ="";
  String address ="";
  String userName ="";
  String zip ="";
  List<Address> otherAddressList = [];
  bool defaultAddd = false;
  FocusNode streetFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode addressLineFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode zipFocus = FocusNode();
  TextEditingController streetController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressLineController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  final emailformKey = GlobalKey<FormState>();

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
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child:  Container(
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
                      ),flex: 3,),

                      Flexible(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              viewDetails();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).cardColor,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 22.0,
                              color: Theme.of(context).focusColor,
                            ),
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
               // Padding(
               //    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
               //    child: Container(
               //      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
               //      width: MediaQuery.of(context).size.width,
               //      decoration: BoxDecoration(
               //        borderRadius: BorderRadius.circular(15.0),
               //        gradient: new LinearGradient(
               //            colors: [
               //              CustomTheme.of(context)
               //                  .cardColor
               //                  .withOpacity(0.5),
               //              CustomTheme.of(context)
               //                  .shadowColor
               //                  .withOpacity(0.5)
               //            ],
               //            begin: Alignment.center,
               //            end: Alignment.topRight,
               //            stops: [0.0, 1.0],
               //            tileMode: TileMode.clamp),
               //      ),
               //      child: Column(
               //        crossAxisAlignment:
               //        CrossAxisAlignment
               //            .start,
               //        children: [
               //          const SizedBox(
               //            height: 15.0,
               //          ),
               //          Text(
               //            userName.toString(),
               //            style: CustomWidget(context: context).CustomSizedTextStyle(
               //                14.0,
               //                Theme.of(
               //                    context)
               //                    .focusColor,
               //                FontWeight
               //                    .w600,
               //                'FontRegular'),
               //            textAlign:
               //            TextAlign
               //                .start,
               //            overflow:
               //            TextOverflow
               //                .ellipsis,
               //          ),
               //          const SizedBox(
               //            height: 5.0,
               //          ),
               //          Text(
               //            AppLocalizations.instance
               //                .text("loc_address")+" :",
               //            style: CustomWidget(context: context).CustomSizedTextStyle(
               //                18.0,
               //                Theme.of(
               //                    context)
               //                    .focusColor,
               //                FontWeight
               //                    .w600,
               //                'FontRegular'),
               //            textAlign:
               //            TextAlign
               //                .start,
               //            overflow:
               //            TextOverflow
               //                .ellipsis,
               //          ),
               //          const SizedBox(
               //            height: 5.0,
               //          ),
               //          Column(
               //            crossAxisAlignment: CrossAxisAlignment.start,
               //            children: [
               //              Container(
               //                child: Text(
               //                  address.toString(),
               //                  style: CustomWidget(context: context).CustomSizedTextStyle(
               //                      14.0,
               //                      Theme.of(
               //                          context)
               //                          .focusColor,
               //                      FontWeight
               //                          .w600,
               //                      'FontRegular'),
               //                  textAlign:
               //                  TextAlign
               //                      .start,
               //                  overflow:
               //                  TextOverflow
               //                      .ellipsis,
               //                ),
               //              ),
               //              const SizedBox(
               //                height: 5.0,
               //              ),
               //              Text(
               //                city.toString(),
               //                style: CustomWidget(context: context).CustomSizedTextStyle(
               //                    14.0,
               //                    Theme.of(
               //                        context)
               //                        .focusColor,
               //                    FontWeight
               //                        .w600,
               //                    'FontRegular'),
               //                textAlign:
               //                TextAlign
               //                    .start,
               //                overflow:
               //                TextOverflow
               //                    .ellipsis,
               //              ),
               //              const SizedBox(
               //                height: 5.0,
               //              ),
               //              Text(
               //                zip.toString(),
               //                style: CustomWidget(context: context).CustomSizedTextStyle(
               //                    14.0,
               //                    Theme.of(
               //                        context)
               //                        .focusColor,
               //                    FontWeight
               //                        .w600,
               //                    'FontRegular'),
               //                textAlign:
               //                TextAlign
               //                    .start,
               //                overflow:
               //                TextOverflow
               //                    .ellipsis,
               //              ),
               //              const SizedBox(
               //                height: 5.0,
               //              ),
               //              Text(
               //                mobileNo.toString(),
               //                style: CustomWidget(context: context).CustomSizedTextStyle(
               //                    14.0,
               //                    Theme.of(
               //                        context)
               //                        .focusColor,
               //                    FontWeight
               //                        .w600,
               //                    'FontRegular'),
               //                textAlign:
               //                TextAlign
               //                    .start,
               //                overflow:
               //                TextOverflow
               //                    .ellipsis,
               //              ),
               //            ],
               //          ),
               //          const SizedBox(
               //            height: 15.0,
               //          ),
               //        ],
               //      ),
               //    ),
               //  ),

              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            // otherAddressList.length>0 ?
            Padding(padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
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
                               0==index ? Container() :Container(
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
                : Container(
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
            ),
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
            // print(loginData.result!.addressHome!.address.toString());
            if(loginData.result!.addressHome!.address.toString() !="null"){
              otherAddressList.add(loginData.result!.addressHome!);
            }

            otherAddressList=otherAddressList.reversed.toList();

          });
          // CustomWidget(context: context).
          // custombar("Profile", loginData.message.toString(), true);

        }
        else {
          loading = false;
          CustomWidget(context: context)
              .custombar("Address", loginData.message.toString(), false);

        }
      });

    }).catchError((Object error) {


      print(error);
      setState(() {
        loading = false;
      });
    });
  }

  viewDetails() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: true,
        context: context,
        builder: (BuildContext con) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter ssetState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  margin: EdgeInsets.only(top: 5.0),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    right: 15.0,
                    left: 15.0,
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: SingleChildScrollView(
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color:
                                Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
                              ),
                              alignment: Alignment.center,
                              width: 40.0,
                              height: 4.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // AppLocalizations.instance
                                                //     .text("loc_cleaning"),
                                                "Address line road",
                                                style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    18.0,
                                                    Theme.of(context)
                                                        .primaryColor,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                // AppLocalizations.instance
                                                //     .text("loc_cleaning"),
                                                "Street, address, city",
                                                style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    14.0,
                                                    Theme.of(context)
                                                        .canvasColor,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child:   Container(
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
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 20.0,
                                                  color: Theme.of(context).focusColor,
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  AppLocalizations.instance
                                                      .text("loc_change"),
                                                  style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                      14.0,
                                                      Theme.of(context)
                                                          .focusColor,
                                                      FontWeight.w500,
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
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Container(
                                    color: Theme.of(context).splashColor,
                                    height: 1.0,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Container(
                                    padding:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                                    child: Form(
                                      key: emailformKey,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          TextFormFieldCustom(
                                            onEditComplete: () {
                                              addressFocus.unfocus();
                                              FocusScope.of(context)
                                                  .requestFocus(addressFocus);
                                            },
                                            radius: 6.0,
                                            error: "Enter House/Flat number",
                                            textColor: Theme.of(context).primaryColor,
                                            borderColor:
                                            Theme.of(context).dividerColor,
                                            fillColor: Theme.of(context).focusColor,
                                            hintStyle: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.3),
                                                FontWeight.w500,
                                                'FontRegular'),
                                            textStyle: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                            textInputAction: TextInputAction.next,
                                            focusNode: streetFocus,
                                            maxlines: 1,
                                            text: '',
                                            hintText: "House/Flat number",
                                            obscureText: false,
                                            textChanged: (value) {},
                                            onChanged: () {},
                                            suffix: Container(
                                              width: 0.0,
                                            ),
                                            validator: (value) {
                                              if(streetController.text.isEmpty) {
                                                return "Please Enter House/Flat number";
                                              }
                                            },
                                            enabled: true,
                                            textInputType: TextInputType.name,
                                            controller: streetController,
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormFieldCustom(
                                            onEditComplete: () {
                                              addressFocus.unfocus();
                                              FocusScope.of(context)
                                                  .requestFocus(addressLineFocus);
                                            },
                                            radius: 6.0,
                                            error: "Enter Street name",
                                            textColor: Theme.of(context).primaryColor,
                                            borderColor:
                                            Theme.of(context).dividerColor,
                                            fillColor: Theme.of(context).focusColor,
                                            hintStyle: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.3),
                                                FontWeight.w500,
                                                'FontRegular'),
                                            textStyle: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                            textInputAction: TextInputAction.next,
                                            focusNode: addressFocus,
                                            maxlines: 1,
                                            text: '',
                                            hintText: "Street name",
                                            obscureText: false,
                                            textChanged: (value) {},
                                            onChanged: () {},
                                            suffix: Container(
                                              width: 0.0,
                                            ),
                                            validator: (value) {
                                              if(addressController.text.isEmpty) {
                                                return "Please Enter Street Details";
                                              }
                                            },
                                            enabled: true,
                                            textInputType:
                                            TextInputType.streetAddress,
                                            controller: addressController,
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormFieldCustom(
                                            onEditComplete: () {
                                              addressLineFocus.unfocus();
                                              FocusScope.of(context)
                                                  .requestFocus(cityFocus);
                                            },
                                            radius: 6.0,
                                            error: "Enter Address",
                                            textColor: Theme.of(context).primaryColor,
                                            borderColor:
                                            Theme.of(context).dividerColor,
                                            fillColor: Theme.of(context).focusColor,
                                            hintStyle: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.3),
                                                FontWeight.w500,
                                                'FontRegular'),
                                            textStyle: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                            textInputAction: TextInputAction.next,
                                            focusNode: addressLineFocus,
                                            maxlines: 1,
                                            text: '',
                                            hintText: "Address",
                                            obscureText: false,
                                            textChanged: (value) {},
                                            onChanged: () {},
                                            suffix: Container(
                                              width: 0.0,
                                            ),
                                            validator: (value) {
                                              if(addressLineController.text.isEmpty) {
                                                return "Please Enter Address Details";
                                              }
                                            },
                                            enabled: true,
                                            textInputType:
                                            TextInputType.streetAddress,
                                            controller: addressLineController,
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: TextFormFieldCustom(
                                                    onEditComplete: () {
                                                      cityFocus.unfocus();
                                                      FocusScope.of(context)
                                                          .requestFocus(zipFocus);
                                                    },
                                                    radius: 6.0,
                                                    error: "Enter City",
                                                    textColor: Theme.of(context)
                                                        .primaryColor,
                                                    borderColor: Theme.of(context)
                                                        .dividerColor,
                                                    fillColor:
                                                    Theme.of(context).focusColor,
                                                    hintStyle:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(0.3),
                                                        FontWeight.w500,
                                                        'FontRegular'),
                                                    textStyle:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w500,
                                                        'FontRegular'),
                                                    textInputAction:
                                                    TextInputAction.next,
                                                    focusNode: cityFocus,
                                                    maxlines: 1,
                                                    text: '',
                                                    hintText: "City",
                                                    obscureText: false,
                                                    textChanged: (value) {},
                                                    onChanged: () {},
                                                    suffix: Container(
                                                      width: 0.0,
                                                    ),
                                                    validator: (value) {
                                                      if(cityController.text.isEmpty) {
                                                        return "Please Enter City Details";
                                                      }
                                                    },
                                                    enabled: true,
                                                    textInputType:
                                                    TextInputType.streetAddress,
                                                    controller: cityController,
                                                  ),
                                                  flex: 1,
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Flexible(
                                                  child: TextFormFieldCustom(
                                                    onEditComplete: () {
                                                      zipFocus.unfocus();
                                                      // FocusScope.of(context).requestFocus(addressLineFocus);
                                                    },
                                                    radius: 6.0,
                                                    error: "Enter Zip Code",
                                                    textColor: Theme.of(context)
                                                        .primaryColor,
                                                    borderColor: Theme.of(context)
                                                        .dividerColor,
                                                    fillColor:
                                                    Theme.of(context).focusColor,
                                                    hintStyle:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(0.3),
                                                        FontWeight.w500,
                                                        'FontRegular'),
                                                    textStyle:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w500,
                                                        'FontRegular'),
                                                    textInputAction:
                                                    TextInputAction.next,
                                                    focusNode: zipFocus,
                                                    maxlines: 1,
                                                    text: '',
                                                    hintText: "Zip Code",
                                                    obscureText: false,
                                                    textChanged: (value) {},
                                                    onChanged: () {},
                                                    suffix: Container(
                                                      width: 0.0,
                                                    ),
                                                    validator: (value) {
                                                      if(zipController.text.isEmpty) {
                                                        return "Please Enter Zip Code Details";
                                                      }
                                                    },
                                                    enabled: true,
                                                    textInputType:
                                                    TextInputType.number,
                                                    controller: zipController,
                                                  ),
                                                  flex: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          // Container(
                                          //   child: Row(
                                          //     children: [
                                          //       Flexible(
                                          //         child: CustomSwitch(
                                          //           onChanged: (val){
                                          //
                                          //             ssetState(() {
                                          //               defaultAddd=val;
                                          //             });
                                          //           },
                                          //           value: defaultAddd,
                                          //           activeColor:
                                          //           Theme.of(context).cardColor,
                                          //           circleColor:
                                          //           Theme.of(context).focusColor,
                                          //           inactiveColor: Theme.of(context)
                                          //               .dialogBackgroundColor
                                          //               .withOpacity(0.5),
                                          //         ),
                                          //       ),
                                          //       const SizedBox(
                                          //         width: 10.0,
                                          //       ),
                                          //       Text(
                                          //         "Make this my default address",
                                          //         style:
                                          //         CustomWidget(context: context)
                                          //             .CustomSizedTextStyle(
                                          //             14.0,
                                          //             Theme.of(context)
                                          //                 .primaryColor,
                                          //             FontWeight.w500,
                                          //             'FontRegular'),
                                          //         textAlign: TextAlign.start,
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // const SizedBox(
                                          //   height: 15.0,
                                          // ),
                                          // Container(
                                          //   child: Row(
                                          //     children: [
                                          //       InkWell(
                                          //         onTap: (){
                                          //           ssetState(() {
                                          //             home =true;
                                          //             other =false;
                                          //           });
                                          //           },
                                          //         child: Container(
                                          //           padding: EdgeInsets.fromLTRB(
                                          //               10.0, 5.0, 10.0, 5.0),
                                          //           decoration: home ? BoxDecoration(
                                          //             borderRadius:
                                          //             BorderRadius.circular(15.0),
                                          //             gradient: LinearGradient(
                                          //               begin: Alignment.topLeft,
                                          //               end: Alignment.bottomRight,
                                          //               colors: [
                                          //                 const Color(0xFF0DD8FF),
                                          //                 const Color(0xFF0FABFF),
                                          //                 const Color(0xFF1457FF),
                                          //                 const Color(0xFF1636FF),
                                          //                 const Color(0xFF0E69C7),
                                          //               ],
                                          //             ),
                                          //           ) : BoxDecoration(
                                          //               borderRadius:
                                          //               BorderRadius.circular(15.0),
                                          //               color: Theme.of(context)
                                          //                   .focusColor,
                                          //               border: Border.all(
                                          //                 width: 1.0,
                                          //                 color: Theme.of(context)
                                          //                     .dividerColor,
                                          //               )),
                                          //           child: Center(
                                          //             child: Text(
                                          //               AppLocalizations.instance
                                          //                   .text("loc_home"),
                                          //               style: CustomWidget(
                                          //                   context: context)
                                          //                   .CustomSizedTextStyle(
                                          //                   14.0,
                                          //                   home ? Theme.of(context)
                                          //                       .focusColor :Theme.of(context)
                                          //                       .dialogBackgroundColor
                                          //                       .withOpacity(0.5),
                                          //                   FontWeight.w500,
                                          //                   'FontRegular'),
                                          //               textAlign: TextAlign.center,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       const SizedBox(
                                          //         width: 10.0,
                                          //       ),
                                          //       InkWell(
                                          //         onTap: (){
                                          //           ssetState(() {
                                          //             home =false;
                                          //             other =true;
                                          //           });
                                          //         },
                                          //         child: Container(
                                          //           padding: EdgeInsets.fromLTRB(
                                          //               10.0, 5.0, 10.0, 5.0),
                                          //           decoration: other ?BoxDecoration(
                                          //             borderRadius:
                                          //             BorderRadius.circular(15.0),
                                          //             gradient: LinearGradient(
                                          //               begin: Alignment.topLeft,
                                          //               end: Alignment.bottomRight,
                                          //               colors: [
                                          //                 const Color(0xFF0DD8FF),
                                          //                 const Color(0xFF0FABFF),
                                          //                 const Color(0xFF1457FF),
                                          //                 const Color(0xFF1636FF),
                                          //                 const Color(0xFF0E69C7),
                                          //               ],
                                          //             ),
                                          //           ) : BoxDecoration(
                                          //               borderRadius:
                                          //               BorderRadius.circular(15.0),
                                          //               color: Theme.of(context)
                                          //                   .focusColor,
                                          //               border: Border.all(
                                          //                 width: 1.0,
                                          //                 color: Theme.of(context)
                                          //                     .dividerColor,
                                          //               )),
                                          //           child: Center(
                                          //             child: Text(
                                          //               AppLocalizations.instance
                                          //                   .text("loc_other"),
                                          //               style: CustomWidget(
                                          //                   context: context)
                                          //                   .CustomSizedTextStyle(
                                          //                   14.0,
                                          //                   other ? Theme.of(context)
                                          //                       .focusColor : Theme.of(context)
                                          //                       .dialogBackgroundColor
                                          //                       .withOpacity(0.5),
                                          //                   FontWeight.w500,
                                          //                   'FontRegular'),
                                          //               textAlign: TextAlign.center,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              ssetState(() {
                                                if (emailformKey.currentState!.validate()) {
                                                  setState(() {
                                                    loading = true;
                                                    updateAddress();
                                                  });
                                                }
                                              });

                                            },
                                            child: Container(
                                              padding:
                                              EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30.0),
                                                color: Theme.of(context).shadowColor,
                                              ),
                                              child: Text(
                                                AppLocalizations.instance
                                                    .text("loc_add_add"),
                                                style: CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    14.0,
                                                    Theme.of(context).focusColor,
                                                    FontWeight.w800,
                                                    'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }

  updateAddress() {
    apiUtils
        .updateAddDetails((streetController.text.toString()+ addressController.text.toString()+addressLineController.text.toString()), cityController.text.toString(), zipController.text.toString())
        .then((CommonModel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;
          });
          CustomWidget(context: context).
          custombar("Address", loginData.message.toString(), true);

          Navigator.of(context).pop();
          addressDetails();
          streetController.clear();
          addressController.clear();
          addressLineController.clear();
          cityController.clear();
          zipController.clear();

        }
        else {
          loading = false;
          CustomWidget(context: context)
              .custombar("Address", loginData.message.toString(), false);

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
