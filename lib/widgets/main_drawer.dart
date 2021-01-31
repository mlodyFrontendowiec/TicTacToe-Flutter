import 'package:flutter/material.dart';
import 'package:tictac/screen/history_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.brown,
      child: Column(
        children: [
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            // alignment: Alignment.bottomLeft,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.history,
                    size: 24,
                  ),
                  title: Text(
                    "History games",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () =>
                      Navigator.of(context).pushNamed(HistoryScreen.nameRoute),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
