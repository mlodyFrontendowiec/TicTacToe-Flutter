import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const String nameRoute = '/history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.brown),
        body: Center(
          child: Text("History games"),
        ));
  }
}
