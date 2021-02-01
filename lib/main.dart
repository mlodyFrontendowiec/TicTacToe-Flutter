import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/providers/history_games.dart';
import 'package:tictac/screen/game_screen.dart';
import 'package:tictac/screen/history_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryGames(),
      child: MaterialApp(
        theme: ThemeData(canvasColor: const Color(0xffF0A500)),
        title: 'Flutter Demo',
        home: Game(),
        initialRoute: '/',
        routes: {HistoryScreen.nameRoute: (ctx) => HistoryScreen()},
      ),
    );
  }
}
