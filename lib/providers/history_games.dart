import 'package:flutter/material.dart';
import 'package:tictac/providers/history_game.dart';

class HistoryGames extends ChangeNotifier {
  List<HistoryGame> _games = [];

  List<HistoryGame> get games {
    return [..._games];
  }

  void addGames(id, result) {
    _games.add(HistoryGame(id, DateTime.now(), result));
    notifyListeners();
  }
}
