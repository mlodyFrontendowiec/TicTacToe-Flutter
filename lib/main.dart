import 'package:flutter/material.dart';
import 'package:tictac/screen/game_screen.dart';
import 'package:tictac/screen/history_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List cards = ["", "", "", "", "", "", "", "", ""];
  String char = "O";

  void setCard(index) {
    if ((cards[index] == "")) {
      setState(() {
        cards[index] = char;
      });
      changeChar();
      setResult();
    }
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
      cards = ["", "", "", "", "", "", "", "", ""];
      char = "O";
    });
  }

  String checkWin() {
    List<List<int>> lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (int i = 0; i < lines.length; i++) {
      var a = lines[i][0];
      var b = lines[i][1];
      var c = lines[i][2];
      if (cards[a] != "" && cards[a] == cards[b] && cards[a] == cards[c]) {
        return cards[a];
      }
    }
  }

  String setResult() {
    if (checkWin() != null) {
      return checkWin();
    } else if (!cards.contains("")) {
      return "remis";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: const Color(0xffF0A500)),
      title: 'Flutter Demo',
      home: Game(cards, setCard, restartGame, setResult, restartGame),
      initialRoute: '/',
      routes: {HistoryScreen.nameRoute: (ctx) => HistoryScreen()},
    );
  }
}
