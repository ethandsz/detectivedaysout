import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './main.dart' as main;
import './variables.dart' as variables;
import './methods.dart' as methods;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  void _onItemTapped(int index) {
    setState(() {
      variables.navigationIndex = index;
      if (index == 0) {
        toHome();
      }
    });
  }

  void toHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => main.MyStatefulWidget()));
  }

  static const _initalCameraPosition = CameraPosition(
    target: LatLng(52.2053, 0.1218),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    if (variables.mapAccess) {
      return Scaffold(
        body: GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            markers: {
              variables.firstClue,
              variables.secondClue,
              variables.thirdClue
            },
            initialCameraPosition: _initalCameraPosition),
      );
    }
    return Scaffold(
        body: Center(
            child: Text('You do not have access to the map, please login')));
  }
}
