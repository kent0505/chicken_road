import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/shop/shop_bloc.dart';
import '../core/utils.dart';
import '../models/item.dart';
import '../widgets/button.dart';
import '../widgets/main_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_scaffold.dart';
import '../widgets/win_dialog.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool remember = false;
  bool canTap = false;
  bool started = false;
  int seconds = 20;
  Timer? _timer;

  List<Item> items = [
    Item(id: 1, index: 1, active: false, done: false),
    Item(id: 2, index: 2, active: false, done: false),
    Item(id: 3, index: 3, active: false, done: false),
    Item(id: 4, index: 4, active: false, done: false),
    Item(id: 5, index: 5, active: false, done: false),
    Item(id: 6, index: 6, active: false, done: false),
    Item(id: 7, index: 7, active: false, done: false),
    Item(id: 8, index: 8, active: false, done: false),
    Item(id: 9, index: 9, active: false, done: false),
    Item(id: 10, index: 10, active: false, done: false),
    Item(id: 11, index: 11, active: false, done: false),
    Item(id: 12, index: 12, active: false, done: false),
    Item(id: 13, index: 13, active: false, done: false),
    Item(id: 14, index: 14, active: false, done: false),
  ];

  List<Item> items2 = [
    Item(id: 1, index: 15, active: false, done: false),
    Item(id: 2, index: 16, active: false, done: false),
    Item(id: 3, index: 17, active: false, done: false),
    Item(id: 4, index: 18, active: false, done: false),
    Item(id: 5, index: 19, active: false, done: false),
    Item(id: 6, index: 20, active: false, done: false),
    Item(id: 7, index: 21, active: false, done: false),
    Item(id: 8, index: 22, active: false, done: false),
    Item(id: 9, index: 23, active: false, done: false),
    Item(id: 10, index: 24, active: false, done: false),
    Item(id: 11, index: 25, active: false, done: false),
    Item(id: 12, index: 26, active: false, done: false),
    Item(id: 13, index: 27, active: false, done: false),
    Item(id: 14, index: 28, active: false, done: false),
  ];

  void startTimer() {
    setState(() {
      canTap = true;
      started = true;
    });
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (seconds > 0) {
        if (mounted) {
          setState(() {
            seconds--;
          });
        }
      } else {
        timer.cancel();
        if (stats.length == 20) stats.removeLast();
        stats.add('Lose');
        await saveStringList('stats', stats);
        if (mounted) {
          await showDialog(
            context: context,
            builder: (context) {
              return WinDialog(amount: 0);
            },
          );
        }
      }
    });
  }

  void onItem(Item value) async {
    if (!canTap) return;
    if (remember) {
      canTap = false;
      for (Item item in items) {
        if (item.index == value.index) item.active = true;
      }
      final item1 = items.firstWhere((x) => x.active && !x.done);
      final item2 = items.lastWhere((x) => x.active && !x.done);
      if (item1.id == item2.id) {
        item1.done = true;
        item2.done = true;
        remember = false;
        canTap = true;
        bool finished = items.every((item) => item.done);
        if (finished) {
          context.read<ShopBloc>().add(AddCoins());
          _timer?.cancel();
          if (stats.length == 20) stats.removeLast();
          stats.add('+250');
          await saveStringList('stats', stats);
          await Future.delayed(Duration(milliseconds: 500), () {
            if (mounted) {
              showDialog(
                context: context,
                builder: (context) {
                  return WinDialog(amount: 250);
                },
              );
            }
          });
        }
      } else {
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            item1.active = false;
            item2.active = false;
            remember = false;
            canTap = true;
          });
        });
      }
    } else {
      remember = true;
      for (Item item in items) {
        if (item.index == value.index) item.active = true;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    items.shuffle();
    items.removeRange(5, 13);
    List<Item> newItems = [];
    for (Item item in items) {
      for (Item item2 in items2) {
        if (item2.id == item.id) newItems.add(item2);
      }
    }
    items.addAll(newItems);
    items.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/stars.png'), context);
    precacheImage(AssetImage('assets/win.png'), context);
    precacheImage(AssetImage('assets/coin.png'), context);

    return MyScaffold(
      body: Column(
        children: [
          MyAppbar(
            timer: true,
            seconds: seconds,
            max: 20,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemCard(
                item: items[0],
                onPressed: onItem,
              ),
              SizedBox(width: 20),
              ItemCard(
                item: items[1],
                onPressed: onItem,
              ),
              SizedBox(width: 20),
              ItemCard(
                item: items[2],
                onPressed: onItem,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemCard(
                item: items[3],
                onPressed: onItem,
              ),
              SizedBox(width: 20),
              ItemCard(
                item: items[4],
                onPressed: onItem,
              ),
              SizedBox(width: 20),
              ItemCard(
                item: items[5],
                onPressed: onItem,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemCard(
                item: items[6],
                onPressed: onItem,
              ),
              SizedBox(width: 20),
              ItemCard(
                item: items[7],
                onPressed: onItem,
              ),
              SizedBox(width: 20),
              ItemCard(
                item: items[8],
                onPressed: onItem,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemCard(
                item: items[9],
                onPressed: onItem,
              ),
              SizedBox(width: 20),
              ItemCard(
                item: items[10],
                onPressed: onItem,
              ),
              SizedBox(width: 20),
              ItemCard(
                item: items[11],
                onPressed: onItem,
              ),
            ],
          ),
          Spacer(),
          started
              ? SizedBox(height: 70)
              : MainButton(
                  title: 'START',
                  onPressed: startTimer,
                ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
    required this.onPressed,
  });

  final Item item;
  final void Function(Item) onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: item.done
          ? null
          : () {
              onPressed(item);
            },
      child: Container(
        height: MediaQuery.of(context).size.width / 3 - 30,
        width: MediaQuery.of(context).size.width / 3 - 30,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 4,
            color: Color(0xff6E78B3),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff585E81),
              Color(0xff43466E),
            ],
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 6),
              color: Color(0xff464866),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            item.active
                ? 'assets/items/item${item.id}.png'
                : 'assets/items/item0.png',
          ),
        ),
      ),
    );
  }
}
