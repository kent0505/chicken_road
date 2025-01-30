import 'package:flutter/material.dart';

import '../widgets/main_button.dart';
import '../widgets/my_scaffold.dart';
import '../widgets/rounded_button.dart';
import '../widgets/settings_dialog.dart';
import 'game_page.dart';
import 'quiz_page.dart';
import 'shop_page.dart';
import 'stats_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/items/item0.png'), context);
    precacheImage(AssetImage('assets/items/item1.png'), context);
    precacheImage(AssetImage('assets/items/item2.png'), context);
    precacheImage(AssetImage('assets/items/item3.png'), context);
    precacheImage(AssetImage('assets/items/item4.png'), context);
    precacheImage(AssetImage('assets/items/item5.png'), context);
    precacheImage(AssetImage('assets/items/item6.png'), context);
    precacheImage(AssetImage('assets/items/item7.png'), context);
    precacheImage(AssetImage('assets/items/item8.png'), context);
    precacheImage(AssetImage('assets/items/item9.png'), context);
    precacheImage(AssetImage('assets/items/item10.png'), context);
    precacheImage(AssetImage('assets/items/item11.png'), context);
    precacheImage(AssetImage('assets/items/item12.png'), context);
    precacheImage(AssetImage('assets/items/item13.png'), context);
    precacheImage(AssetImage('assets/items/item14.png'), context);

    return MyScaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20 + MediaQuery.of(context).viewPadding.top),
            Row(
              children: [
                Spacer(),
                RoundedButton(
                  asset: 'settings',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return SettingsDialog();
                      },
                    );
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
            Spacer(),
            MainButton(
              title: 'PLAY',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GamePage();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            MainButton(
              title: 'QUIZ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            MainButton(
              title: 'SHOP',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ShopPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            MainButton(
              title: 'STATS',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return StatsPage();
                    },
                  ),
                );
              },
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
