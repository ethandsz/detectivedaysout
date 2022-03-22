import 'package:flutter/material.dart';
import './map.dart' as map;
// ignore: library_prefixes

import 'package:animated_text_kit/animated_text_kit.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: textPart()),
    ));
  }

  Widget textPart() => AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            "Cambridge is full of mysteries and dark secrets. Today you will reveal some of them using this app as a guide. And no later than by the end of this day you'll find out how these stories are all connected",
            textStyle: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            speed: Duration(milliseconds: 70),
            //curve: Curves.fastOutSlowIn,
          ),
          TypewriterAnimatedText(
            "Collect the facts and stories, visit all the marked locations around the town and complete the tasks. All these bits of information will help your deductive minds to come to the right conclusion when you'll be witnessing some events tonight.",
            textStyle: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            speed: Duration(milliseconds: 40),
          ),
          TypewriterAnimatedText(
            "When you arrive at each location, the information in the app will unlock automatically for you. Read it, watch it, discover the site. Analyze all the smallest details.",
            textStyle: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            speed: Duration(milliseconds: 40),
          ),
          TypewriterAnimatedText(
            "Apart from the locations you’ll need to visit today, on the map you can also see the signs marking pubs, cafes and restaurants around the city offering you special meal deals and allowing you to charge your electronic devices. Your badge is your pass, use it to claim your special deal.",
            textStyle: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            speed: Duration(milliseconds: 40),
          ),
          TypewriterAnimatedText(
            "Don’t forget to arrive at the evening performance location marked on the map not later than by 5.30PM.",
            textStyle: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            speed: Duration(milliseconds: 20),
          ),
          TypewriterAnimatedText(
            "Enjoy!",
            textStyle: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            speed: Duration(milliseconds: 10),
          ),
        ],
        isRepeatingAnimation: false,
        repeatForever: false,
        onTap: () {
          print("Tap Event");
        },
        onFinished: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const map.MapScreen()));
        },
      );
}
