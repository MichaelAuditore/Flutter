import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioPlayer();
  void playSound(int noteNumber, int op) {
    final song = AudioCache();
    song.play('$noteNumber,$op.mp3');
  }

  Expanded buildKey(int number, int opus) {
    return Expanded(
      child: RaisedButton(
        child: Text('Waltz $number for piano, Op.$opus'),
        onPressed: () {
          player.stop();
          player.release();
          playSound(number, opus);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, 18),
              buildKey(1, 34),
              buildKey(1, 64),
              buildKey(1, 69),
              buildKey(1, 70),
              buildKey(2, 34),
              buildKey(2, 64),
              buildKey(2, 69),
              buildKey(2, 70),
              buildKey(3, 34),
              buildKey(3, 64),
              buildKey(3, 70),
              buildKey(5, 42),
            ],
          ),
        ),
      ),
    );
  }
}
