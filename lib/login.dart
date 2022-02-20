import 'package:flutter/material.dart';

import './variables.dart' as variables;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textController = new TextEditingController();

  @override
  void init() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextField(
        controller: textController,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter 10Digit Key",
          hintStyle: TextStyle(color: Colors.grey),
        ),
        onEditingComplete: () {
          variables.tenDigitKey = textController.text;
          print(variables.tenDigitKey);
          if (variables.tenDigitKey.length > 9) {
            variables.mapAccess = true;
          }
        },
      )),
    );
  }
}
