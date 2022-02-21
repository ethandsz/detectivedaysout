import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import './main.dart' as main;
import './variables.dart' as variables;
import './methods.dart' as methods;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  late Position currentPosition;
  var geoLocator = Geolocator();

  void locatePosition() async {
    print("EFEFF");

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    print(currentPosition);
  }

  //Could be removed in future version
  void _onItemTapped(int index) {
    setState(() {
      variables.navigationIndex = index;
      if (index == 0) {
        toHome();
      }
    });
  }

  //Could be removed aswell
  void toHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => main.MyStatefulWidget()));
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
              checkpermission_location();
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;
              locatePosition();
            },
            mapType: MapType.hybrid,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            markers: {
              //Markers located in the variables.dart file
              variables.firstClue,
              variables.secondClue,
              variables.thirdClue
            },
            initialCameraPosition: _initalCameraPosition),
      );
    }
    //Refuses access if 10 Digit key is not provided
    return Scaffold(
        body: Center(
            child: Text('You do not have access to the map, please login')));
  }
}
