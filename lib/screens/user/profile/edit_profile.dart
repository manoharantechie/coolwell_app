import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:coolwell_app/common/textformfield_custom.dart';

class Edit_Profile_Screen extends StatefulWidget {
  const Edit_Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_Screen> createState() => _Edit_Profile_ScreenState();
}

class _Edit_Profile_ScreenState extends State<Edit_Profile_Screen> {

  List<String> coinlist = ["Mr", "Mrs",];
  String selectedValue = "";
  bool loading = false;
  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode addressLineFocus = FocusNode();
  FocusNode pinCodeFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressLineController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = coinlist.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              const Color(0xFF1636FF).withOpacity(0.3),
              const Color(0xFF0FABFF).withOpacity(0.3),

            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment. spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50.0,),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
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
                              .text("loc_edit_profile"),
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
                  const SizedBox(height: 30.0,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 130.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).focusColor,
                              image: DecorationImage(
                                image: AssetImage("assets/images/profile.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child:  InkWell(
                                    onTap: (){

                                    },
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      padding: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color:  Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: SvgPicture.asset("assets/profile/camera.svg",),
                                    ),),
                                )

                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                         Container(
                           child:  Row(
                             children: [
                               Container(
                                 width: MediaQuery.of(context).size.width * 0.18,
                                 padding: EdgeInsets.fromLTRB(8, 0.0, 5, 0.0),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     bottomLeft: Radius.circular(6.0),
                                     topLeft: Radius.circular(6.0)
                                   ),
                                   color: Theme.of(context).focusColor,
                                 ),
                                 child: Theme(
                                   data: Theme.of(context).copyWith(
                                     canvasColor: Theme.of(context).backgroundColor,
                                   ),
                                   child: DropdownButtonHideUnderline(
                                     child: DropdownButton(
                                       menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
                                       items: coinlist
                                           .map((value) => DropdownMenuItem(
                                         child: Text(
                                           value.toString(),
                                           style: CustomWidget(context: context)
                                               .CustomSizedTextStyle(
                                               14.0,
                                               Theme.of(context).primaryColor,
                                               FontWeight.w500,
                                               'FontRegular'),
                                         ),
                                         value: value,
                                       )).toList(),
                                       onChanged: (value) async {
                                         setState(() {
                                           selectedValue = value.toString();
                                           loading=true;

                                         });
                                       },
                                       hint: Text(
                                         " ",
                                         style: CustomWidget(context: context)
                                             .CustomSizedTextStyle(
                                             14.0,
                                             Theme.of(context).primaryColor,
                                             FontWeight.w600,
                                             'FontRegular'),
                                       ),
                                       isExpanded: true,
                                       value: selectedValue,
                                       icon: Icon(
                                         Icons.keyboard_arrow_down_outlined,
                                         color: Theme.of(context).primaryColor,
                                         // color: Them,
                                         // color: AppColors.otherTextColor,
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               Flexible(child: TextFormField(
                                 controller: nameController,
                                 focusNode: nameFocus,
                                 maxLines: 1,
                                 textInputAction: TextInputAction.next,
                                 keyboardType: TextInputType.name,
                                 style: CustomWidget(context: context).CustomSizedTextStyle(
                                     14.0,
                                     Theme.of(context).primaryColor,
                                     FontWeight.w500,
                                     'FontRegular'),
                                 decoration: InputDecoration(
                                   contentPadding: const EdgeInsets.only(
                                       left: 12, right: 0, top: 2, bottom: 2),
                                   hintText: "Name",
                                   hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                       14.0,
                                       Theme.of(context).primaryColor.withOpacity(0.3),
                                       FontWeight.w500,
                                       'FontRegular'),
                                   filled: true,
                                   fillColor: Theme.of(context)
                                       .focusColor,
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.only(
                                       topRight: Radius.circular(5.0),
                                       bottomRight: Radius.circular(5.0),
                                     ),
                                     borderSide: BorderSide(
                                         color: Theme.of(context)
                                             .splashColor
                                             .withOpacity(0.5),
                                         width: 1.0),
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.only(
                                       topRight: Radius.circular(5.0),
                                       bottomRight: Radius.circular(5.0),
                                     ),
                                     borderSide: BorderSide(
                                         color: Theme.of(context)
                                             .splashColor
                                             .withOpacity(0.5),
                                         width: 1.0),
                                   ),
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.only(
                                       topRight: Radius.circular(5.0),
                                       bottomRight: Radius.circular(5.0),
                                     ),
                                     borderSide: BorderSide(
                                         color: Theme.of(context)
                                             .splashColor
                                             .withOpacity(0.5),
                                         width: 1.0),
                                   ),
                                   errorBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.only(
                                       topRight: Radius.circular(5.0),
                                       bottomRight: Radius.circular(5.0),
                                     ),
                                     borderSide: BorderSide(
                                         color: Theme.of(context)
                                             .splashColor
                                             .withOpacity(0.5),
                                         width: 1.0),
                                   ),
                                 ),
                               )),
                             ],
                           ),
                         ),
                          const SizedBox(height: 15.0,),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              emailFocus.unfocus();
                              FocusScope.of(context).requestFocus(addressFocus);
                            },
                            radius: 6.0,
                            error: "Enter E-Mail Id",
                            textColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).dividerColor,
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: emailFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "Mail ID",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: Container(
                              width: 0.0,
                            ),
                            validator: (value) {

                            },
                            enabled: true,
                            textInputType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                          const SizedBox(height: 15.0,),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              addressFocus.unfocus();
                              FocusScope.of(context).requestFocus(addressLineFocus);
                            },
                            radius: 6.0,
                            error: "Enter Address",
                            textColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).dividerColor,
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: addressFocus,
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

                            },
                            enabled: true,
                            textInputType: TextInputType.streetAddress,
                            controller: addressController,
                          ),
                          const SizedBox(height: 15.0,),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              addressLineFocus.unfocus();
                              FocusScope.of(context).requestFocus(pinCodeFocus);
                            },
                            radius: 6.0,
                            error: "Enter Address line",
                            textColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).dividerColor,
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: addressLineFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "Address line",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: Container(
                              width: 0.0,
                            ),
                            validator: (value) {

                            },
                            enabled: true,
                            textInputType: TextInputType.streetAddress,
                            controller: addressLineController,
                          ),
                          const SizedBox(height: 15.0,),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              pinCodeFocus.unfocus();
                              // FocusScope.of(context).requestFocus(phoneNumFocus);
                            },
                            radius: 6.0,
                            error: "Enter Pin code",
                            textColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).dividerColor,
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: pinCodeFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "Pin code",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: Container(
                              width: 0.0,
                            ),
                            validator: (value) {

                            },
                            enabled: true,
                            textInputType: TextInputType.number,
                            controller: pinCodeController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/profile/Inactive.svg", height: 15.0,),
                        const SizedBox(width: 5.0,),
                        Text(
                          AppLocalizations.instance
                              .text("loc_deactive"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w400,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      children: [
                        SvgPicture.asset("assets/profile/delete.svg", height: 15.0,),
                        const SizedBox(width: 5.0,),
                        Text(
                          AppLocalizations.instance
                              .text("loc_dele_acc"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).disabledColor,
                              FontWeight.w400,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50.0,),
                    Align(
                      alignment: Alignment.center,
                      child:  InkWell(
                        onTap:(){

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Theme.of(context).buttonColor,
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
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
