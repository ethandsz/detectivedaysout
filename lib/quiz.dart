import 'package:detectivedaysout/globalVariable.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import './map.dart' as map;
import './video_items.dart' as vid;

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
    Widget okButton = ButtonTheme(
        child: Align(
            alignment: Alignment.center,
            child: TextButton(
              child: Text("Ok"),
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontFamily: 'Akrobat',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Wrong Answer"),
      content: Column(children: <Widget>[
        Text("False"),
        vid.VideoItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/GERALD_FINALE.mp4"),
            looping: false)
      ]),
      actions: [
        okButton,
      ],
      scrollable: true,
      backgroundColor: Colors.white,
      contentTextStyle: TextStyle(
          fontFamily: 'Akrobat',
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      titleTextStyle: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontFamily: 'Akrobat'),
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
    Widget okButton = ButtonTheme(
        child: Align(
            alignment: Alignment.center,
            child: TextButton(
              child: Text("Ok"),
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontFamily: 'Akrobat',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  closeQuiz = true;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => map.MapScreen()));
              },
            )));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("True"),
      content: Column(children: <Widget>[
        Text("Correct"),
        vid.VideoItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/INTRO..mp4"),
            looping: false)
      ]),
      actions: [
        okButton,
      ],
      scrollable: true,
      backgroundColor: Colors.white,
      contentTextStyle: TextStyle(
          fontFamily: 'Akrobat',
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      titleTextStyle: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontFamily: 'Akrobat'),
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
