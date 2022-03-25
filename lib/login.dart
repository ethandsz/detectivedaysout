// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './variables.dart' as variables;
import './video_instructions.dart' as vid;
import './map.dart' as map;

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
                  image: AssetImage("assets/loginlogo.png"), fit: BoxFit.cover),
            ),
            height: double.infinity,
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 60,
                      width: 380,
                      child: TextField(
                        //Text field widget
                        controller: textController,
                        obscureText: true,
                        decoration: InputDecoration(
                          //Decor for the box
                          fillColor: Colors.white,
                          filled: true,
                          //icon: Icon(Icons.send),
                          border: OutlineInputBorder(),
                          hintText: "Enter 10 Digit Key",
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
                      )),
                  const SizedBox(
                    height: 2,
                    width: 70,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF6D00F4),
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 36,
                              fontFamily: 'Akrobat',
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  vid.VideoInstructions()));
                      },
                      child: const Text('Enter')),
                ])),
        //floatingActionButton: button(),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget button() => FloatingActionButton.extended(
      backgroundColor: Color.fromARGB(255, 90, 47, 248),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      label: Text('Enter'),
      onPressed: () {
       // Navigator.push(context,
         //   MaterialPageRoute(builder: (context) => const map.MapScreen()));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  vid.VideoInstructions()));
                
      });
}
