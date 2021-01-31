import 'package:flutter/material.dart';
import 'package:tictac/widgets/game_board.dart';
import 'package:tictac/widgets/main_drawer.dart';

class Game extends StatelessWidget {
  final List cards;
  final Function setCard;
  final Function resetGame;
  final Function setResult;
  final Function restart;

  Game(this.cards, this.setCard, this.resetGame, this.setResult, this.restart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Tic Tac Toe"),
          actions: [IconButton(icon: Icon(Icons.replay), onPressed: resetGame)],
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
                      restart();
                    },
                  ),
                ],
              ));
  }
}
