import 'package:flutter/material.dart';
import 'package:tictac/screen/Game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List cards = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  String char = "O";

  void setCard(index) {
    setState(() {
      cards[index] = char;
    });
    changeChar();
    print(cards);
  }

  void changeChar() {
    if (char == "O") {
      setState(() {
        char = "X";
      });
    } else if (char == "X") {
      setState(() {
        char = "O";
      });
    }
  }

  void restartGame() {
    setState(() {
      cards = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
      char = "O";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Game(cards, setCard, restartGame),
      initialRoute: '/',
    );
  }
}
