import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xylophone extends StatelessWidget {
   Xylophone({Key? key}) : super(key: key);

  final audioPlayer = AudioPlayer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            soundButton('assets/', 'assets_note1.wav', Colors.red),
            soundButton('assets/', 'assets_note2.wav', Colors.black),
            soundButton('assets/', 'assets_note3.wav', Colors.blue),
            soundButton('assets/', 'assets_note4.wav', Colors.green),
            soundButton('assets/', 'assets_note5.wav', Colors.yellow),
            soundButton('assets/', 'assets_note6.wav', Colors.orange),
            soundButton('assets/', 'assets_note7.wav', Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget soundButton(String prefix, String note, Color color){
    return TextButton(
      onPressed: () async{
        final play = AudioCache(prefix: prefix);
        final url = await play.load(note);
        audioPlayer.setUrl(url.path, isLocal: true);
        await audioPlayer.play(url.path);
      },
      child: Container(
        height: 50,
        width: 50,
        color: color,
      ),
    );
  }
}
