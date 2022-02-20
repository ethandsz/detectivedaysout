import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './map.dart';
import './variables.dart' as variables;
import './methods.dart' as methods;
import './login.dart' as login;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final screens = [
    Center(
        child:
            Text("Home", style: TextStyle(fontSize: 60))), //Home class (TO DO)
    login.LoginPage(), //Login class
    MapScreen() //Map class
  ];
  void _onItemTapped(int index) {
    setState(() {
      variables.navigationIndex = index;
    });
    print(variables.navigationIndex);
  }

  // Widget for scaffold with nav. bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[variables
          .navigationIndex], //The corressponding screens listed in order to the items contained in the navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          //Items contained in the navigation bar
          BottomNavigationBarItem(
            //Home
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            //Login
            icon: Icon(Icons.login_rounded),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            //Map
            icon: Icon(Icons.map_rounded),
            label: 'Map',
          ),
        ],
        currentIndex: variables.navigationIndex,
        selectedItemColor: Colors.amber[800],
        onTap:
            _onItemTapped, //Keeping track of the current index (Could be removed in the future maybe)
      ),
    );
  }
}
