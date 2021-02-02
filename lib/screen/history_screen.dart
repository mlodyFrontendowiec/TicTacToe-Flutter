import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/providers/history_games.dart';
import 'package:tictac/widgets/history_game_tile.dart';

class HistoryScreen extends StatelessWidget {
  static const String nameRoute = '/history';

  @override
  Widget build(BuildContext context) {
    final historyData = Provider.of<HistoryGames>(context);
    final historyGames = historyData.games;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("History Games"),
        ),
        body: historyGames.isEmpty
            ? Center(child: Text("History is empty"))
            : GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: historyGames.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: historyGames[i], child: HistoryItem()),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
              ));
  }
}
