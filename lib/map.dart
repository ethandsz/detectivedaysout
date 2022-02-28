import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'dart:math' as math;

import './main.dart' as main;
import './variables.dart' as variables;
import './methods.dart' as methods;
import './mapvariables.dart' as mapVar;
import './marker_information.dart' as markerInfo;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  Position? currentPosition;
  var geoLocator = Geolocator();
  final double dcheck = 0.00014128694207108202;
  var location = new Location();

  checkpermission_location() async {
    var locationStatus = await Permission.location.status;
    print(locationStatus);

    if (!locationStatus.isGranted) {
      print("gr");
      await Permission.location.request();
    }

    if (!locationStatus.isDenied) {
      print('de');
      await Permission.location.request();
      checkLocation();
    }
  }

  void checkFirstClue(var x, var y) {
    double distance = methods.distance(
        markerInfo.newHamCollege.lat, markerInfo.newHamCollege.long, x, y);
    log("distance: $distance");
    if ((distance < dcheck)) {
      variables.dialogVis = true;
      if ((variables.dialogVis) && (variables.firstClue_cmpltd == false)) {
        mapVar.showAlertDialog(context, markerInfo.newHamCollege.title,
            markerInfo.newHamCollege.body);
        variables.dialogVis = false;
        variables.firstClue_cmpltd = true;
      }
    }
  }

  void checkLocation() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      var lat = currentLocation.latitude;
      var long = currentLocation.longitude;
      checkFirstClue(lat, long);
    });
  }

  //Initial camera position when maps first load
  static const _initalCameraPosition = CameraPosition(
    target: LatLng(52.2053, 0.1218),
    zoom: 11.5,
  );

  //Google map widget
  @override
  Widget build(BuildContext context) {
    //Checks if mapAcess is true
    if (variables.mapAccess) {
      var currentlocation = location.getLocation();
      return Scaffold(
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(mapVar.mapStyle);
            checkpermission_location();
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;
          },
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          markers: {
            //Markers located in the variables.dart file
            Marker(
                markerId: MarkerId('New Ham College'),
                infoWindow: InfoWindow(title: markerInfo.newHamCollege.title),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(markerInfo.newHamCollege.lat,
                    markerInfo.newHamCollege.long),
                onTap: () {
                  if (variables.firstClue_cmpltd) {
                    mapVar.showAlertDialog(
                        context,
                        markerInfo.newHamCollege.title,
                        markerInfo.newHamCollege.body);
                  }
                }),
            Marker(
                markerId: MarkerId('Coe Fen'),
                infoWindow: InfoWindow(title: markerInfo.coeFen.title),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueYellow),
                position:
                    LatLng(markerInfo.coeFen.lat, markerInfo.coeFen.long)),

            Marker(
                markerId: MarkerId('Mathematical Bridge'),
                infoWindow:
                    InfoWindow(title: markerInfo.mathematicalBridge.title),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                position: LatLng(markerInfo.mathematicalBridge.lat,
                    markerInfo.mathematicalBridge.long)),
          },
          initialCameraPosition: _initalCameraPosition,
        ),
      );
    }
    //Refuses access if 10 Digit key is not provided
    return Scaffold(
        body: Center(
            child: Text('You do not have access to the map, please login')));
  }
}
