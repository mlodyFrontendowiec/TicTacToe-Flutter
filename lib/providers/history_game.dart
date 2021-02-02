import 'package:flutter/material.dart';

class HistoryGame extends ChangeNotifier {
  final String id;
  final DateTime date;
  final String result;

  HistoryGame(@required this.id, @required this.date, @required this.result);
}
