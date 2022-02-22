import 'package:flutter/material.dart';
import './variables.dart' as variables;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Image(
          image: AssetImage('assets/homelogo.png'),
        )
      ],
    )));
  }
}
