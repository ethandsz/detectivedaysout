import 'package:flutter/material.dart';
import './variables.dart' as variables;
import './login.dart' as login;

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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/homelogo.png'),
          ),
        ),
        child: GestureDetector(onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => login.LoginPage()));
        }),
      ),
    );
  }
}
