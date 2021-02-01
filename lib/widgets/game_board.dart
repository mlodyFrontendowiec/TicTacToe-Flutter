import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/providers/history_games.dart';

class GameBoard extends StatelessWidget {
  final List cards;
  final Function setCard;

  GameBoard(this.cards, this.setCard);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: cards.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () => setCard(index),
                child: Card(
                  child: Center(
                    child: Text(
                      cards[index],
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
