import 'package:flutter/material.dart';

import '../core/utils.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_scaffold.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        children: [
          MyAppbar(title: 'STATS'),
          Spacer(),
          SizedBox(
            height: 400,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Container(
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        width: 8,
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
                          offset: Offset(0, 10),
                          color: Color(0xff464866),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: ListView(
                      padding: EdgeInsets.all(40),
                      children: List.generate(
                        stats.length,
                        (index) {
                          return Text(
                            stats[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'w700',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
