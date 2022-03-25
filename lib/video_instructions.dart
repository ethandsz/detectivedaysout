import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './video_items.dart' as vid;

class VideoInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        vid.VideoItem(videoPlayerController: VideoPlayerController.asset("assets/Sample.mp4"), looping: true)
      ]),
      
    );
  }
}


