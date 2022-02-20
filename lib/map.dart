import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './main.dart' as main;
import './variables.dart' as variables;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // int _selectedIndex = variables.navigationIndex;
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
    return Scaffold(
      body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initalCameraPosition),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login_rounded),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Map',
          ),
        ],
        currentIndex: variables.navigationIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
