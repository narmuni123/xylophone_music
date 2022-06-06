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
          children: [
            soundButton(context, 'assets/', 'assets_note1.wav', Colors.red),
            soundButton(context, 'assets/', 'assets_note2.wav', Colors.black),
            soundButton(context, 'assets/', 'assets_note3.wav', Colors.blue),
            soundButton(context, 'assets/', 'assets_note4.wav', Colors.green),
            soundButton(context, 'assets/', 'assets_note5.wav', Colors.yellow),
            soundButton(context, 'assets/', 'assets_note6.wav', Colors.orange),
            soundButton(context, 'assets/', 'assets_note7.wav', Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget soundButton(BuildContext context, String prefix, String note, Color color){
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: TextButton(
        onPressed: () async{
          final play = AudioCache(prefix: prefix);
          final url = await play.load(note);
          audioPlayer.setUrl(url.path, isLocal: true);
          await audioPlayer.play(url.path);
        },
        child: Container(
          height: size.height,
          width: size.width,
          color: color,
        ),
      ),
    );
  }
}
