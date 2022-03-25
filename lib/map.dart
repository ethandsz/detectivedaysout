import 'dart:async';
import 'dart:developer';
import 'dart:io';

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
  //Position? currentPosition;
  // var geoLocator = Geolocator();
  final double dcheck = 0.00014128694207108202;
  var location = new Location();
  late BitmapDescriptor marker_notCmplt;
  late BitmapDescriptor marker_cmplt;
  Set<Marker>? _markers = <Marker>{};
  var ClueLocations = <markerInfo.ClueLocation>{};

  @override
  void initState() {
    super.initState();
  }

  void setMarkerIcon() async {
    marker_notCmplt = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50, 50)), 'assets/notCmplt.png');

    marker_cmplt = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50, 50)), 'assets/Cmplt.png');
  }

  checkpermission_location() async {
    var locationStatus = await Permission.location.status;
    print(locationStatus);

    if (!locationStatus.isGranted) {
      print("gr");
      print(await Permission.location.value);
      await Permission.location.request();
      checkpermission_location();
    }

    if (!locationStatus.isDenied) {
      print('de');
      await Permission.location.request();
      checkLocation();
    }
  }

  void checkClue(var x, var y, markerInfo.ClueLocation marker) {
    double distance = methods.distance(marker.lat, marker.long, x, y);
    //log("distance: $distance");
    if ((distance < dcheck)) {
      variables.dialogVis = true;
      if ((variables.dialogVis) && (marker.compl == false)) {
        mapVar.showAlertDialog(context, marker);
        variables.dialogVis = false;
        marker.compl = true;
        generateMarkers();
      }
    }
  }

  void generateMarkers() {
    var localMarkers = <Marker>{};
    localMarkers.add(makeMarker(markerInfo.newHamCollege, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.coeFen, marker_notCmplt));
    localMarkers
        .add(makeMarker(markerInfo.mathematicalBridge, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.graveYard, marker_notCmplt));
    localMarkers
        .add(makeMarker(markerInfo.archeologicalMuseum, marker_notCmplt));
    localMarkers
        .add(makeMarker(markerInfo.addenbrokesHospital, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.stMarysBellTower, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.trinityStreet, marker_notCmplt));
    localMarkers
        .add(makeMarker(markerInfo.viewOfTheBridgeOfSighs, marker_notCmplt));

    if (mounted) {
      for (markerInfo.ClueLocation marker in ClueLocations) {
        if (marker.compl) {
          localMarkers
              .removeWhere((element) => element.markerId == marker.title);
          localMarkers.add(makeMarker(marker, marker_cmplt));
        }
      }
      setState(() {
        _markers = localMarkers;
      });
    }
  }

  void checkLocation() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      var lat = currentLocation.latitude;
      var long = currentLocation.longitude;
      checkClue(lat, long, markerInfo.newHamCollege);
      checkClue(lat, long, markerInfo.coeFen);
      checkClue(lat, long, markerInfo.mathematicalBridge);
      checkClue(lat, long, markerInfo.graveYard);
      checkClue(lat, long, markerInfo.archeologicalMuseum);
      checkClue(lat, long, markerInfo.addenbrokesHospital);
      checkClue(lat, long, markerInfo.stMarysBellTower);
      checkClue(lat, long, markerInfo.trinityStreet);
      checkClue(lat, long, markerInfo.viewOfTheBridgeOfSighs);
    });
  }

  //Initial camera position when maps first load
  static const _initalCameraPosition = CameraPosition(
    target: LatLng(52.2053, 0.1218),
    zoom: 11.5,
  );

  Marker makeMarker(markerInfo.ClueLocation marker, icon) {
    ClueLocations.add(marker);
    for (markerInfo.ClueLocation marker in ClueLocations) {
      var title = marker.title;
      log("List: $title");
    }
    return (Marker(
        markerId: MarkerId(marker.title),
        infoWindow: InfoWindow(title: marker.title),
        icon: icon,
        position: LatLng(marker.lat, marker.long),
        onTap: () {
          if (marker.compl) {
            mapVar.showAlertDialog(context, marker);
          }
        }));
  }

  //Google map widget
  @override
  Widget build(BuildContext context) {
    setMarkerIcon();
    //Checks if mapAcess is true
    if (variables.mapAccess) {
      var currentlocation = location.getLocation();
      return Scaffold(
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            generateMarkers();
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
          markers: _markers!,
          //{
          /*
            //Markers located in the variables.dart file
            makeMarker(markerInfo.newHamCollege),
            makeMarker(markerInfo.coeFen),
            makeMarker(markerInfo.mathematicalBridge),
            makeMarker(markerInfo.graveYard),
            makeMarker(markerInfo.archeologicalMuseum),
            //6.??? Waiting for update from Konstantin
            makeMarker(markerInfo.addenbrokesHospital),
            makeMarker(markerInfo.stMarysBellTower),
            makeMarker(markerInfo.trinityStreet),
            makeMarker(markerInfo.viewOfTheBridgeOfSighs),
            */
          //},
          initialCameraPosition: _initalCameraPosition,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.help),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      );
    }
    //Refuses access if 10 Digit key is not provided
    return Scaffold(
        body: Center(
            child: Text('You do not have access to the map, please login')));
  }
}
