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
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(15),
            color: Color(0xFF5313D4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 0,
                  child: Center(child: Image.asset("assets/QuizLogo.png")),
                ),
                Expanded(
                    child: FlatButton(
                  color: Color(0xFF5313D4),
                  onPressed: () {
                    showAlertDialogTrue(context);
                  },
                  child: Image.asset("assets/GraceQuiz.png"),
                )),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: FlatButton(
                  color: Color(0xFF5313D4),
                  onPressed: () {
                    showAlertDialogGerald(context);
                  },
                  child: Image.asset("assets/GeraldQuiz.png"),
                )),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: FlatButton(
                  color: Color(0xFF5313D4),
                  onPressed: () {
                    showAlertDialogJeremiah(context);
                  },
                  child: Image.asset("assets/JermiahQuiz.png"),
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
            videoPlayerController: VideoPlayerController.network(
                "https://storage.googleapis.com/video-files-ddo/FINALE_JEREMIAH.mp4"),
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
            videoPlayerController: VideoPlayerController.network(
                "https://storage.googleapis.com/video-files-ddo/FINALE_GERALD.mp4"),
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
            videoPlayerController: VideoPlayerController.network(
                "https://storage.googleapis.com/video-files-ddo/FINALE_GRACE..mp4"),
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
