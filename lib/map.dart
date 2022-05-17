import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:detectivedaysout/globalVariable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:math' as math;

import './main.dart' as main;
import './variables.dart' as variables;
import './methods.dart' as methods;
import './mapvariables.dart' as mapVar;
import './marker_information.dart' as markerInfo;
import './video_instructions.dart' as vidInstructions;
import './home.dart' as home;
import './quiz.dart' as quiz;

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
  late BitmapDescriptor marker_food;
  late BitmapDescriptor marker_tour;

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

    marker_food = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50, 50)), 'assets/FoodIcon.png');

    marker_tour = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50, 50)), 'assets/Tour.png');
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
      //Add if statement for final page
    }
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  void checkClue(var x, var y, markerInfo.ClueLocation marker) {
    double distance = methods.distance(marker.lat, marker.long, x, y);
    if (updateMarker) {
      generateMarkers();
    }
    if ((distance < dcheck)) {
      variables.dialogVis = true;
      if ((variables.dialogVis) && (marker.compl == false)) {
        mapVar.showAlertDialog(context, marker);
        variables.dialogVis = false;
        //marker.compl = true;
        //generateMarkers();
      }
    }
  }

  void generateMarkers() {
    var localMarkers = <Marker>{};
    localMarkers.add(makeMarker(markerInfo.courtyardMuseum, marker_tour));
    localMarkers.add(makeMarker(markerInfo.shrewHouse, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.hangedManShop, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.fitzBillies, marker_notCmplt));
    localMarkers
        .add(makeMarker(markerInfo.stephenHokingHouse, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.sittingBridge, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.queensLane, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.privateSide, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.eaglesBeerGarden, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.zizzi, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.michaelHouse, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.trinityLane, marker_notCmplt));
    localMarkers.add(makeMarker(markerInfo.endTour, marker_tour));

    localMarkers.add(makePubMarker(markerInfo.baronBeegPub, marker_food));
    localMarkers.add(makePubMarker(markerInfo.eaglePub, marker_food));
    localMarkers.add(makePubMarker(markerInfo.bathHouse, marker_food));
    localMarkers.add(makePubMarker(markerInfo.princeRegent, marker_food));
    localMarkers.add(makePubMarker(markerInfo.fortGeorge, marker_food));
    localMarkers.add(makePubMarker(markerInfo.grainHope, marker_food));
    localMarkers.add(makePubMarker(markerInfo.pickerellIn, marker_food));

    if (mounted) {
      var location_counter = 0;
      bool quizDone = false;
      for (markerInfo.ClueLocation marker in ClueLocations) {
        log("InCompl");
        if (marker.compl) {
          location_counter = location_counter + 1;
          localMarkers
              .removeWhere((element) => element.markerId == marker.title);
          localMarkers.add(makeMarker(marker, marker_cmplt));
          log("Locations Completed = $location_counter");
          if (location_counter == ClueLocations.length && closeQuiz == false) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => quiz.Quiz()));
            //Create new page here
            break;
          }
        }
      }
      setState(() {
        _markers = localMarkers;
      });
    }
    updateMarker = false;
  }

  void checkLocation() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      var lat = currentLocation.latitude;
      var long = currentLocation.longitude;
      checkClue(lat, long, markerInfo.courtyardMuseum);
      checkClue(lat, long, markerInfo.shrewHouse);
      checkClue(lat, long, markerInfo.hangedManShop);
      checkClue(lat, long, markerInfo.fitzBillies);
      checkClue(lat, long, markerInfo.stephenHokingHouse);
      checkClue(lat, long, markerInfo.sittingBridge);
      checkClue(lat, long, markerInfo.queensLane);
      checkClue(lat, long, markerInfo.privateSide);
      checkClue(lat, long, markerInfo.eaglesBeerGarden);
      checkClue(lat, long, markerInfo.zizzi);
      checkClue(lat, long, markerInfo.michaelHouse);
      checkClue(lat, long, markerInfo.trinityLane);
      checkClue(lat, long, markerInfo.endTour);
    });
  }

  //Initial camera position when maps first load
  static const _initalCameraPosition = CameraPosition(
    target: LatLng(52.2053, 0.1218),
    zoom: 11.5,
  );

  Marker makeMarker(markerInfo.ClueLocation marker, icon) {
    ClueLocations.add(marker);
    var len = ClueLocations.length;
    log("Length = $len");
    return (Marker(
        markerId: MarkerId(marker.title),
        infoWindow: InfoWindow(title: marker.title),
        icon: icon,
        position: LatLng(marker.lat, marker.long),
        onTap: () {
          if (marker.compl) {
            mapVar.showAlertDialog(context, marker);
          }
          //marker.compl = true;
        }));
  }

  Marker makePubMarker(markerInfo.ClueLocation marker, icon) {
    return (Marker(
        markerId: MarkerId(marker.title),
        infoWindow: InfoWindow(
            title: marker.title,
            onTap: () {
              var url = marker.body;
              launchURL(url);
            }),
        icon: marker_food,
        position: LatLng(marker.lat, marker.long)));
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
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => vidInstructions.VideoInstructions()));
          },
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
