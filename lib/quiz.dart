// ignore_for_file: deprecated_member_use

import 'package:detectivedaysout/globalVariable.dart';
import 'package:flutter/material.dart';
import './map.dart' as map;
import 'package:video_player/video_player.dart';
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
                        child: Text('True',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0)),
                        onPressed: () {
                          ListView(children: <Widget>[
                            vid.VideoItem(
                                videoPlayerController:
                                    VideoPlayerController.asset(
                                        "assets/INTRO..mp4"),
                                looping: false)
                          ]);
                        })),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: FlatButton(
                  color: Colors.grey,
                  onPressed: () {},
                  child: Text('False',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                )),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: FlatButton(
                  color: Colors.grey,
                  onPressed: () {},
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

  @override
  Widget videoFirst(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: vid.VideoItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/JEREMIA_FINALE.mp4"),
            looping: false));
  }
}
