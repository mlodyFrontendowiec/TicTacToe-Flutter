import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/providers/history_game.dart';

class HistoryItem extends StatefulWidget {
  @override
  _HistoryItemState createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<HistoryGame>(context);
    return GestureDetector(
      onTap: () {
        print("ok");
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: ListTile(
                title: Text(
                  history.result,
                ),
                subtitle: Text(
                  (history.date).toString(),
                ),
              ),
            ),
          )),
    );
  }
}
