library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './map.dart' as mp;

int navigationIndex = 0;

bool mapAccess = false;

void initState() {
  BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(48, 48)), 'assets/homelogo.png')
      .then((onValue) {
    return onValue;
  });
}

final Marker firstClue = Marker(
    markerId: MarkerId('FirstClue'),
    infoWindow: InfoWindow(title: 'First Clue'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(52.204375, 0.133228));

final Marker secondClue = Marker(
    markerId: MarkerId('SecondClue'),
    infoWindow: InfoWindow(title: 'Second Clue'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: LatLng(52.203730, 0.117649));

final Marker thirdClue = Marker(
    markerId: MarkerId('ThirdClue'),
    infoWindow: InfoWindow(title: 'Third Clue'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(52.211510, 0.124507));
