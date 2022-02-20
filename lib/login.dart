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
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginlogo.png"), fit: BoxFit.cover),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                height: 100,
                width: 380,
                child: TextField(
                  controller: textController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    icon: Icon(Icons.send),
                    border: OutlineInputBorder(),
                    hintText: "Enter 10Digit Key",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  onEditingComplete: () {
                    variables.tenDigitKey = textController.text;
                    print(variables.tenDigitKey);
                    if (variables.tenDigitKey.length > 9) {
                      variables.mapAccess = true;
                    }
                  },
                ))
          ])),
    );
  }
}
