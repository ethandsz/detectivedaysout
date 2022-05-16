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
                      child: Text('Who is the murderer',
                          style: TextStyle(fontSize: 25.0))),
                ),
                Expanded(
                    child: FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    showAlertDialogTrue(context);
                  },
                  child: Text('Grace Martin',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                )),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    showAlertDialogGerald(context);
                  },
                  child: Text('Gerald Martin',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                )),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    showAlertDialogJeremiah(context);
                  },
                  child: Text('Jeremiah Jones',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                )),
              ],
            ),
          ))
        ],
      ),
    );
  }

  showAlertDialogJeremiah(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      scrollable: true,
      title: Text("Answer Wrong"),
      content: Column(children: <Widget>[
        vid.VideoItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/JEREMIAH_FINALE.mp4"),
            looping: false)
      ]),
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

  showAlertDialogGerald(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      scrollable: true,
      title: Text("Answer Wrong"),
      content: Column(children: <Widget>[
        vid.VideoItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/GERALD_FINALE.mp4"),
            looping: false)
      ]),
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
        Navigator.of(context).pop();
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
      scrollable: true,
      content: Column(children: <Widget>[
        vid.VideoItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/GRACE_FINALE.mp4"),
            looping: false)
      ]),
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
