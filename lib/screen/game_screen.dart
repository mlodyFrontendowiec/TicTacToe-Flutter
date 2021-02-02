import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/providers/history_games.dart';
import 'package:tictac/widgets/game_board.dart';
import 'package:tictac/widgets/main_drawer.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
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

  dynamic checkWin() {
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

  dynamic setResult() {
    if (checkWin() != null) {
      return checkWin();
    } else if (!cards.contains("")) {
      return "remis";
    }
  }

  @override
  Widget build(BuildContext context) {
    final historyGames = Provider.of<HistoryGames>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Tic Tac Toe"),
          actions: [
            IconButton(icon: Icon(Icons.replay), onPressed: restartGame)
          ],
        ),
        drawer: MainDrawer(),
        body: setResult() == null
            ? GameBoard(cards, setCard)
            : AlertDialog(
                title: Text(setResult() == 'remis'
                    ? "Draw"
                    : "The winner is ${setResult()}"),
                actions: [
                  TextButton(
                    child: Text('New Game'),
                    onPressed: () {
                      historyGames.addGames(
                          "1",
                          (setResult() == "X" || setResult() == "O")
                              ? 'The winner is ${setResult()}'
                              : "Draw");
                      restartGame();
                    },
                  ),
                ],
              ));
  }
}
