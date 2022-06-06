import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xylophone extends StatelessWidget {
   Xylophone({Key? key}) : super(key: key);

  final audioPlayer = AudioPlayer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () async{
              final play = AudioCache(prefix: 'assets/');
              final url = await play.load("assets_note1.wav");
              audioPlayer.setUrl(url.path, isLocal: true);
              await audioPlayer.play(url.path);
            },
            child: const Text("Click Me"),
          ),
        ),
      ),
    );
  }
}
