import 'package:flutter/material.dart';
import './login.dart' as login;
import './video_instructions.dart' as vid;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/homelogo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => vid.VideoInstructions()));
        }),
      ),
    );
  }
}
