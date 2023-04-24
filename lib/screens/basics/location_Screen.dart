import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Location_Screen extends StatefulWidget {
  const Location_Screen({Key? key}) : super(key: key);

  @override
  State<Location_Screen> createState() => _Location_ScreenState();
}

class _Location_ScreenState extends State<Location_Screen> {
  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  late final MapController _mapController;
  double lat= 0.00;
  double long= 0.00;
  var position;
  var lastPosition;
  List<Marker> markers = [];
  List<Marker> allMarkers = [];

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
              builder: (context) => SvgPicture.asset('assets/images/map_pin.svg',height: 30.0,)
          ),
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
        lat=position.latitude;
        long=position.longitude;
        addPin(LatLng(position.latitude, position.longitude));

      });
    }).catchError((e) {


    });
  }

  _getLocation() async{

    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lastPosition = await Geolocator.getLastKnownPosition();
    setState(() {
    });
  }

  addPin(LatLng latlng) {
    setState(() {
      markers.add(Marker(
        width: 30.0,
        height: 30.0,
        point: latlng,
        builder: (ctx) => Container(
          child: SvgPicture.asset('assets/images/map_pin.svg',height: 50.0,),
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
        margin: EdgeInsets.only(top: 30.0),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height * 0.45,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 10.0),
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
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                        Text(
                          AppLocalizations.instance
                              .text("loc_summary"),
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
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0,),
                 Container(
                   height: MediaQuery.of(context).size.height *0.6,
                   width: MediaQuery.of(context).size.width,
                   child:  FlutterMap(
                     mapController: _mapController,
                     options: MapOptions(
                       center: LatLng(25, 80),
                       zoom: 6,
                       interactiveFlags: InteractiveFlag.all - InteractiveFlag.rotate,
                     ),
                     children: [
                       TileLayer(
                         urlTemplate:
                         "https://api.mapbox.com/styles/v1/sadham7866/cldpzdl3l008z01t9hh8rmiai/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FkaGFtNzg2NiIsImEiOiJjbGRvZWlqOWEwMG93M29xd2JmOHN0ZGdzIn0.CkrgphN30vtdI3uln9xBpA",
                         additionalOptions: {
                           'mapStyleId': 'cldofwgi5000d01ruov0d377n',
                           'accessToken': 'sk.eyJ1Ijoic2FkaGFtNzg2NiIsImEiOiJjbGRvZzEwM2owMDhmM3VscHNjeHBqZmVnIn0.neun916O4dDcO1Jjcg1y_Q',
                         },
                       ),
                       // TileLayer(
                       //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                       //   userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                       // ),
                       // MarkerLayer(
                       //     markers: allMarkers.sublist(
                       //         0, min(allMarkers.length, 2))),
                     ],
                   ),
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
