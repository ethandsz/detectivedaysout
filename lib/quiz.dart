// ignore_for_file: deprecated_member_use

import 'package:detectivedaysout/globalVariable.dart';
import 'package:flutter/material.dart';
import './map.dart' as map;

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            color: Colors.blueGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                      child:
                          Text('QUESTIONS', style: TextStyle(fontSize: 25.0))),
                ),
                Expanded(
                    child: FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    showAlertDialogTrue(context);
                  },
                  child: Text('True',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                )),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    showAlertDialogFalse(context);
                  },
                  child: Text('False',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                )),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    showAlertDialogFalse(context);
                  },
                  child: Text('False',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                )),
              ],
            ),
          ))
        ],
      ),
    );
  }

  showAlertDialogFalse(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Answer Wrong"),
      content: Text("You answer is wrong, try again!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogTrue(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        setState(() {
          closeQuiz = true;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => map.MapScreen()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Answer Correct!"),
      content: Text("You resolved the mistery, Congratulations!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
