import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './map.dart';
import './variables.dart' as variables;

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
  // int _selectedIndex = variables.navigationIndex;
  void _onItemTapped(int index) {
    setState(() {
      variables.navigationIndex = index;
      if (index == 2) {
        toMap();
      }
    });
    print(variables.navigationIndex);
  }

  void toMap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/homelogo.png"),
          fit: BoxFit.cover,
        )),
      ),
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
