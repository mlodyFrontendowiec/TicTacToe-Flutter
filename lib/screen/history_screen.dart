import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/providers/history_game.dart';
import 'package:tictac/providers/history_games.dart';

class HistoryScreen extends StatelessWidget {
  static const String nameRoute = '/history';

  @override
  Widget build(BuildContext context) {
    final historyData = Provider.of<HistoryGames>(context);
    final historyGames = historyData.games;

    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.brown),
        body: GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: historyGames.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (ctx) => historyGames[i], child: ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    ););
  }
}
