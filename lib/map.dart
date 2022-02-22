import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math' as math;

import './main.dart' as main;
import './variables.dart' as variables;
import './methods.dart' as methods;
import './mapvariables.dart' as mapVar;

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

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .moveCamera(CameraUpdate.newCameraPosition(cameraPosition));
    CameraUpdate.newCameraPosition(cameraPosition);
  }

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
      locatePosition();
    }
  }

  void checkFirstClue() {
    locatePosition();
    double distance = methods.distance(
        mapVar.firstClue.position.latitude,
        mapVar.firstClue.position.longitude,
        currentPosition?.latitude,
        currentPosition?.longitude);
    log("distance: $distance");
    if (distance < dcheck) {
      mapVar.showAlertDialog(context);
    }
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
      return Scaffold(
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(mapVar.mapStyle);
            checkpermission_location();
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;
            locatePosition();
          },
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          markers: {
            //Markers located in the variables.dart file
            mapVar.firstClue,
            mapVar.secondClue,
            mapVar.thirdClue
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
