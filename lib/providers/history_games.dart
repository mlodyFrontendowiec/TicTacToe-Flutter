import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tictac/providers/history_game.dart';

class HistoryGames extends ChangeNotifier {
  List<HistoryGame> _games = [HistoryGame("1", DateTime(1), "ok")];

  List<HistoryGame> get games {
    return [..._games];
  }

  void addGames(id, title) {
    _games.add(HistoryGame(id, DateTime.now(), title));
    notifyListeners();
  }
}
