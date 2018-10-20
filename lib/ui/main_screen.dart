import 'package:flutter/material.dart';
import 'package:m3ml/model/user_card_model.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
          CardModel(),
        ],
      ),
    );
  }
}
