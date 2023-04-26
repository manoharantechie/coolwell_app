import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:coolwell_app/common/custom_switch.dart';
import 'package:coolwell_app/common/custom_widget.dart';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:coolwell_app/common/textformfield_custom.dart';

class Location_Screen extends StatefulWidget {
  const Location_Screen({Key? key}) : super(key: key);

  @override
  State<Location_Screen> createState() => _Location_ScreenState();
}

class _Location_ScreenState extends State<Location_Screen> {
  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  late final MapController _mapController;
  double lat = 0.00;
  double long = 0.00;
  var position;
  var lastPosition;
  bool status = false;
  List<Marker> markers = [];
  List<Marker> allMarkers = [];
  ScrollController controller = ScrollController();
  FocusNode nameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode addressLineFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode zipFocus = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressLineController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
    getPermission();
    _getLocation();
    _mapController = MapController();
    Future.microtask(() {
      final r = Random();
      for (var x = 0; x < 20; x++) {
        allMarkers.add(
          Marker(
              point: LatLng(
                // 9.939093,78.121719,
                doubleInRange(r, 10, 35),
                doubleInRange(r, 71, 90),
              ),
              builder: (context) => SvgPicture.asset(
                    'assets/images/map_pin.svg',
                    height: 30.0,
                  )),
        );
      }
      setState(() {});
    });
  }

  getPermission() async {
    if (await Permission.location.request().isGranted) {
      _getCurrentLocation();
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      if (statuses[Permission.location] == PermissionStatus.granted) {
        _getCurrentLocation();
      }
    }
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        lat = position.latitude;
        long = position.longitude;
        addPin(LatLng(position.latitude, position.longitude));
      });
    }).catchError((e) {});
  }

  _getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lastPosition = await Geolocator.getLastKnownPosition();
    setState(() {});
  }

  addPin(LatLng latlng) {
    setState(() {
      markers.add(Marker(
        width: 30.0,
        height: 30.0,
        point: latlng,
        builder: (ctx) => Container(
          child: SvgPicture.asset(
            'assets/images/map_pin.svg',
            height: 50.0,
          ),
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 50.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage("assets/images/location_back.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          onTap: () {
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
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          AppLocalizations.instance.text("loc_summary"),
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 200.0),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center: LatLng(25, 80),
                  zoom: 6,
                  interactiveFlags:
                      InteractiveFlag.all - InteractiveFlag.rotate,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/sadham7866/cldpzdl3l008z01t9hh8rmiai/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FkaGFtNzg2NiIsImEiOiJjbGRvZWlqOWEwMG93M29xd2JmOHN0ZGdzIn0.CkrgphN30vtdI3uln9xBpA",
                    additionalOptions: {
                      'mapStyleId': 'cldofwgi5000d01ruov0d377n',
                      'accessToken':
                          'sk.eyJ1Ijoic2FkaGFtNzg2NiIsImEiOiJjbGRvZzEwM2owMDhmM3VscHNjeHBqZmVnIn0.neun916O4dDcO1Jjcg1y_Q',
                    },
                  ),
                  // TileLayer(
                  //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  //   userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  // ),
                  MarkerLayer(
                      markers: markers.sublist(0, min(markers.length, 1))),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  viewDetails();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).buttonColor,
                  ),
                  child: Text(
                    AppLocalizations.instance.text("loc_Proceed_checkout"),
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0,
                        Theme.of(context).focusColor,
                        FontWeight.w800,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
                                Theme.of(context).accentColor.withOpacity(0.5),
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
                                            "Adress line , street, city",
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
                                    Container(
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFormFieldCustom(
                                      onEditComplete: () {
                                        nameFocus.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(addressFocus);
                                      },
                                      radius: 6.0,
                                      error: "Enter Name",
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
                                      focusNode: nameFocus,
                                      maxlines: 1,
                                      text: '',
                                      hintText: "Name",
                                      obscureText: false,
                                      textChanged: (value) {},
                                      onChanged: () {},
                                      suffix: Container(
                                        width: 0.0,
                                      ),
                                      validator: (value) {},
                                      enabled: true,
                                      textInputType: TextInputType.name,
                                      controller: nameController,
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
                                      focusNode: addressFocus,
                                      maxlines: 1,
                                      text: '',
                                      hintText: "House/Flat number",
                                      obscureText: false,
                                      textChanged: (value) {},
                                      onChanged: () {},
                                      suffix: Container(
                                        width: 0.0,
                                      ),
                                      validator: (value) {},
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
                                      validator: (value) {},
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
                                              validator: (value) {},
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
                                              validator: (value) {},
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
                                    Container(
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: CustomSwitch(
                                              value: false,
                                              activeColor:
                                                  Theme.of(context).cardColor,
                                              circleColor:
                                                  Theme.of(context).focusColor,
                                              inactiveColor: Theme.of(context)
                                                  .accentColor
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "Make this my default address",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w500,
                                                        'FontRegular'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
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
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.instance
                                                    .text("loc_home"),
                                                style: CustomWidget(
                                                        context: context)
                                                    .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .focusColor,
                                                        FontWeight.w500,
                                                        'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 5.0, 10.0, 5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                color: Theme.of(context)
                                                    .focusColor,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                )),
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.instance
                                                    .text("loc_other"),
                                                style: CustomWidget(
                                                        context: context)
                                                    .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .accentColor
                                                            .withOpacity(0.5),
                                                        FontWeight.w500,
                                                        'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(


                                        padding:
                                        EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          color: Theme.of(context).buttonColor,
                                        ),
                                        child: Text(
                                          AppLocalizations.instance
                                              .text("loc_Proceed_checkout"),
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
}

class MapMarker {
  final String? image;
  final String? title;
  final String? address;
  final LatLng? location;
  final int? rating;

  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
    required this.rating,
  });
}
