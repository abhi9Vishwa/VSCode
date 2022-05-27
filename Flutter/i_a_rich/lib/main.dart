// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache(prefix: 'assets/');
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey(int input) {
    var color = input*100;
    return Expanded(
      child: FlatButton(
        color: Colors.blue[color],
        onPressed: () {
          playSound(input);
          // print('pressed');
        }, child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1),
              buildKey(2),
              buildKey(3),
              buildKey(4),
              buildKey(5),
              buildKey(6),
              buildKey(7),
            ]),
        ),
      ),
    );
  }
}
