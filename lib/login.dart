// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './map.dart' as map;
import './variables.dart' as variables;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textController =
      new TextEditingController(); //Controller for the TextField Widget (MAKE PRIVATE_)

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
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/loginlogo.png"),
                      fit: BoxFit.cover),
                ),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 380,
                          child: TextField(
                            //Text field widget
                            controller: textController,
                            obscureText: true,
                            decoration: InputDecoration(
                              //Decor for the box
                              fillColor: Colors.white,
                              filled: true,
                              icon: Icon(Icons.send),
                              border: OutlineInputBorder(),
                              hintText: "Enter 10Digit Key",
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            onEditingComplete: () {
                              //Function for saving the user input to global variable and checking if the code matches to allow access to maps
                              variables.tenDigitKey = textController.text;
                              print(variables.tenDigitKey);
                              if (variables.tenDigitKey.length > 9) {
                                variables.mapAccess = true;
                              }
                            },
                          ))
                    ])),
            floatingActionButton: FloatingActionButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => map.MapScreen()));
            })));
  }
}
