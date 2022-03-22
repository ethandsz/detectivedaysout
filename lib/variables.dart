library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './map.dart' as mp;

int navigationIndex = 0; //Navigation bar index

String tenDigitKey = ""; //Ten digit key user inputs

bool mapAccess = true; //Map access
bool dialogVis = false;

//BitmapDescriptor customicon = BitmapDescriptor.fromAssetImage(configuration, assetName)

/*
@override
void initState() {
  BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(48, 48)), 'assets/homelogo.png')
      .then((onValue) {
    customicon = onValue;
  });
}
*/