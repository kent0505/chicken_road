import 'package:flutter/material.dart';

import '../widgets/item_card.dart';
import '../widgets/main_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_scaffold.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        children: [
          MyAppbar(timer: true),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemCard(id: 1),
              SizedBox(width: 20),
              ItemCard(id: 2),
              SizedBox(width: 20),
              ItemCard(id: 3),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemCard(id: 4),
              SizedBox(width: 20),
              ItemCard(id: 5),
              SizedBox(width: 20),
              ItemCard(id: 6),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemCard(id: 7),
              SizedBox(width: 20),
              ItemCard(id: 8),
              SizedBox(width: 20),
              ItemCard(id: 9),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemCard(id: 10),
              SizedBox(width: 20),
              ItemCard(id: 11),
              SizedBox(width: 20),
              ItemCard(id: 12),
            ],
          ),
          Spacer(),
          MainButton(
            title: 'START',
            onPressed: () {},
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
