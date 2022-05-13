import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './video_items.dart' as vid;
import './map.dart' as map;

class VideoInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: <Widget>[
        vid.VideoItem(
            videoPlayerController: VideoPlayerController.network(
                "https://storage.googleapis.com/video-files-ddo/INTRO.mp4"),
            looping: false)
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next_rounded),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const map.MapScreen()));
        },
      ),
      floatingActionButtonLocation: (FloatingActionButtonLocation.miniStartTop),
    );
  }
}
