import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:coolwell_app/common/textformfield_custom.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/custom_button.dart';
import '../../../data/api_utils.dart';
import '../../../data/model/get_profile_details_model.dart';
import '../../../data/model/register.dart';
import '../../../data/model/upload_image_model.dart';

class Edit_Profile_Screen extends StatefulWidget {
  const Edit_Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_Screen> createState() => _Edit_Profile_ScreenState();
}

class _Edit_Profile_ScreenState extends State<Edit_Profile_Screen> {

  APIUtils apiUtils = APIUtils();
  var snackBar;
  List<String> coinlist = ["Mr", "Mrs",];
  String selectedValue = "";
  bool loading = false;
  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode addressLineFocus = FocusNode();
  FocusNode pinCodeFocus = FocusNode();
  FocusNode documentFocus = FocusNode();
  TextEditingController documentController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressLineController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  String profileImage = "";
  bool? selectImg = false;
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  final profileformKey = GlobalKey<FormState>();
  GetProfileResult? details;
  String email ="";
  String userName ="";
  String mobileNo ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = coinlist.first;
    loading =true;
    profile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
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
                                    image: profileImage == "" || profileImage == "null"
                                        ? DecorationImage(
                                        image:
                                        AssetImage("assets/images/profile.png"),
                                        fit: BoxFit.cover)
                                        : selectImg!
                                        ? DecorationImage(
                                        image: FileImage(File(imageFile!.path)),
                                        fit: BoxFit.cover)
                                        : DecorationImage(
                                        image: NetworkImage(profileImage),
                                        fit: BoxFit.cover)
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child:  InkWell(
                                        onTap: (){
                                          onRequestPermission();
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
                                        hintText: userName.toString(),
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
                                    14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                                textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                    14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                                textInputAction: TextInputAction.next,
                                focusNode: emailFocus,
                                maxlines: 1,
                                text: '',
                                hintText: email.toString(),
                                obscureText: false,
                                textChanged: (value) {},
                                onChanged: () {},
                                suffix: Container(
                                  width: 0.0,
                                ),
                                validator: (value) {

                                },
                                enabled: false,
                                textInputType: TextInputType.emailAddress,
                                controller: emailController,
                              ),
                              const SizedBox(height: 15.0,),
                              TextFormFieldCustom(
                                onEditComplete: () {

                                },
                                radius: 6.0,
                                error: "Enter Mobile",
                                textColor: Theme.of(context).primaryColor,
                                borderColor: Theme.of(context).dividerColor,
                                fillColor: Theme.of(context).focusColor,
                                hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                    14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                                textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                    14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                                textInputAction: TextInputAction.next,
                                focusNode: emailFocus,
                                maxlines: 1,
                                text: '',
                                hintText: mobileNo.toString(),
                                obscureText: false,
                                textChanged: (value) {},
                                onChanged: () {},
                                suffix: Container(
                                  width: 0.0,
                                ),
                                validator: (value) {

                                },
                                enabled: false,
                                textInputType: TextInputType.phone,
                                controller: emailController,
                              ),
                              const SizedBox(height: 15.0,),
                              // TextFormFieldCustom(
                              //   onEditComplete: () {
                              //     addressFocus.unfocus();
                              //     FocusScope.of(context).requestFocus(pinCodeFocus);
                              //   },
                              //   radius: 6.0,
                              //   error: "Enter Address",
                              //   textColor: Theme.of(context).primaryColor,
                              //   borderColor: Theme.of(context).dividerColor,
                              //   fillColor: Theme.of(context).focusColor,
                              //   hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              //       14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                              //   textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              //       14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                              //   textInputAction: TextInputAction.next,
                              //   focusNode: addressFocus,
                              //   maxlines: 1,
                              //   text: '',
                              //   hintText: "Address",
                              //   obscureText: false,
                              //   textChanged: (value) {},
                              //   onChanged: () {},
                              //   suffix: Container(
                              //     width: 0.0,
                              //   ),
                              //   validator: (value) {
                              //
                              //   },
                              //   enabled: true,
                              //   textInputType: TextInputType.streetAddress,
                              //   controller: addressController,
                              // ),
                              // const SizedBox(height: 15.0,),
                              // // TextFormFieldCustom(
                              // //   onEditComplete: () {
                              // //     addressLineFocus.unfocus();
                              // //     FocusScope.of(context).requestFocus(pinCodeFocus);
                              // //   },
                              // //   radius: 6.0,
                              // //   error: "Enter Address line",
                              // //   textColor: Theme.of(context).primaryColor,
                              // //   borderColor: Theme.of(context).dividerColor,
                              // //   fillColor: Theme.of(context).focusColor,
                              // //   hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              // //       14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                              // //   textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              // //       14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                              // //   textInputAction: TextInputAction.next,
                              // //   focusNode: addressLineFocus,
                              // //   maxlines: 1,
                              // //   text: '',
                              // //   hintText: "Address line",
                              // //   obscureText: false,
                              // //   textChanged: (value) {},
                              // //   onChanged: () {},
                              // //   suffix: Container(
                              // //     width: 0.0,
                              // //   ),
                              // //   validator: (value) {
                              // //
                              // //   },
                              // //   enabled: true,
                              // //   textInputType: TextInputType.streetAddress,
                              // //   controller: addressLineController,
                              // // ),
                              // // const SizedBox(height: 15.0,),
                              // TextFormFieldCustom(
                              //   onEditComplete: () {
                              //     pinCodeFocus.unfocus();
                              //     // FocusScope.of(context).requestFocus(phoneNumFocus);
                              //   },
                              //   radius: 6.0,
                              //   error: "Enter Pin code",
                              //   textColor: Theme.of(context).primaryColor,
                              //   borderColor: Theme.of(context).dividerColor,
                              //   fillColor: Theme.of(context).focusColor,
                              //   hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              //       14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                              //   textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              //       14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                              //   textInputAction: TextInputAction.next,
                              //   focusNode: pinCodeFocus,
                              //   maxlines: 1,
                              //   text: '',
                              //   hintText: "Pin code",
                              //   obscureText: false,
                              //   textChanged: (value) {},
                              //   onChanged: () {},
                              //   suffix: Container(
                              //     width: 0.0,
                              //   ),
                              //   validator: (value) {
                              //
                              //   },
                              //   enabled: true,
                              //   textInputType: TextInputType.number,
                              //   controller: pinCodeController,
                              // ),
                              // const SizedBox(height: 15.0,),
                              // TextFormFieldCustom(
                              //   onEditComplete: () {
                              //     documentFocus.unfocus();
                              //     // FocusScope.of(context).requestFocus(phoneNumFocus);
                              //   },
                              //   radius: 6.0,
                              //   error: "Enter Update document",
                              //   textColor: Theme.of(context).primaryColor,
                              //   borderColor: Theme.of(context).dividerColor,
                              //   fillColor: Theme.of(context).focusColor,
                              //   hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              //       14.0, Theme.of(context).primaryColor.withOpacity(0.3), FontWeight.w500, 'FontRegular'),
                              //   textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              //       14.0, Theme.of(context).primaryColor, FontWeight.w500, 'FontRegular'),
                              //   textInputAction: TextInputAction.next,
                              //   focusNode: documentFocus,
                              //   maxlines: 1,
                              //   text: '',
                              //   hintText: "Update document",
                              //   obscureText: false,
                              //   textChanged: (value) {},
                              //   onChanged: () {},
                              //   suffix: Container(
                              //     child: Icon(
                              //       Icons.file_upload_outlined,
                              //       size: 18.0,
                              //       color: Theme.of(context).primaryColor,
                              //     ),
                              //   ),
                              //   validator: (value) {
                              //
                              //   },
                              //   enabled: true,
                              //   textInputType: TextInputType.text,
                              //   controller: documentController,
                              // ),
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
                        const SizedBox(height: 50.0,),
                        Align(
                          alignment: Alignment.center,
                          child:  InkWell(
                            onTap:(){
                              if(nameController.text.isEmpty){
                                CustomWidget(context: context)
                                    .custombar("Profile", "Please Enter Name", false);
                              } else if(addressController.text.isEmpty){
                                CustomWidget(context: context)
                                    .custombar("Profile", "Please Enter Address details", false);
                              } else if(pinCodeController.text.isEmpty){
                                CustomWidget(context: context)
                                    .custombar("Profile", "Please Enter Pincode ", false);
                              } else{
                                setState(() {
                                  loading = true;
                                  updateProfile();
                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
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
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
          loading
              ? CustomWidget(context: context).loadingIndicator(
            Theme.of(context).primaryColor,
          )
              : Container()
        ],
      ),
    );
  }

  profile() {
    apiUtils
        .getProfileDetails()
        .then((GetProfileDetailsModel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;
            details = loginData.result!;

            var str = loginData.result!.name!.split(".");
            print(str);
            userName =loginData.result!.name!.contains(".")?str[1].trim().toString():loginData.result!.name!;
            // gender=loginData.result!.name!.contains(".")?str[0].trim().toString():"";
            email=details!.email.toString();
            mobileNo=details!.phone.toString();
            profileImage=details!.profile_pic.toString();

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

  updateProfile() {
    apiUtils
        .updateProfileDetails(
        selectedValue.toString()+"."+
            nameController.text.toString(),
        addressController.text.toString(),
        pinCodeController.text.toString(), profileImage)
        .then((CommonModel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;
          });
          CustomWidget(context: context).
          custombar("Profile", loginData.message.toString(), true);

          nameController.clear();
          addressController.clear();
          pinCodeController.clear();
          Navigator.pop(context);

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

  onRequestPermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.camera,
      ].request();

    } else {
      _pickedImageDialog();
    }
  }

  _pickedImageDialog() {
    showModalBottomSheet<void>(
      //background color for modal bottom screen
      backgroundColor: Theme.of(context).focusColor,
      //elevates modal bottom screen
      elevation: 10,
      isScrollControlled: true,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text

        // Returning SizedBox instead of a Container
        return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Choose image source",
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(16.0, Theme.of(context).primaryColor,
                              FontWeight.w600, 'FontRegular'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: ButtonCustom(
                                  text: "Gallery",
                                  iconEnable: false,
                                  radius: 5.0,
                                  icon: "",
                                  textStyle: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      18.0,
                                      Theme.of(context).focusColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                                  iconColor: Theme.of(context).focusColor,
                                  shadowColor: Theme.of(context).cardColor,
                                  splashColor: Theme.of(context).focusColor,
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                      getImage(ImageSource.gallery);
                                    });
                                  },
                                  paddng: 1.0),
                              flex: 4,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              child: ButtonCustom(
                                  text: "Camera",
                                  iconEnable: false,
                                  radius: 5.0,
                                  icon: "",
                                  textStyle: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      18.0,
                                      Theme.of(context).focusColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                                  iconColor: Theme.of(context).focusColor,
                                  shadowColor: Theme.of(context).cardColor,
                                  splashColor: Theme.of(context).focusColor,
                                  onPressed: () {
                                    setState(() {

                                      Navigator.pop(context);
                                      getImage(ImageSource.camera);
                                    });
                                  },
                                  paddng: 1.0),
                              flex: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  /// Get from gallery
  getImage(ImageSource type) async {

    var pickedFile = await picker.pickImage(source: type);
    if (pickedFile != null) {
      setState(() {
        selectImg = true;
        imageFile = File(pickedFile.path);
        doUploadImage(imageFile!);

      });
    }
  }

  doUploadImage(File? img) {

    setState(() {
      loading=true;
    });
    apiUtils.doUpload(img!.path).then((UploadImageModel loginData) {
      if (loginData.success!) {
        setState(() {
          loading = false;
          setState(() {
            profileImage = loginData.result!.toString();
          });
          CustomWidget(context: context)
              .custombar("Profile","Profile Image uploaded successfully", true);
        });
      } else {
        setState(() {
          loading = false;
          CustomWidget(context: context)
              .custombar("Profile", loginData.message.toString(), false);
        });
      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }

}
