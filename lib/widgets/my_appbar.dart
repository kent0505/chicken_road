import 'package:flutter/material.dart';

import 'rounded_button.dart';
import 'settings_dialog.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
    this.title = '',
    this.timer = false,
    this.seconds = 0,
  });

  final String title;
  final bool timer;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20 + MediaQuery.of(context).viewPadding.top,
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          RoundedButton(
            asset: 'home',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Center(
              child: timer
                  ? Column(
                      children: [
                        Text(
                          'TIME',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'w700',
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                              color: Color(0xff6E78B3),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff43466E),
                                Color(0xff585E81),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Container(
                              height: 16,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color(0xff282844),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 4),
                                  Center(
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 1000),
                                      height: 10,
                                      width: (seconds / 10) * 112,
                                      decoration: BoxDecoration(
                                        color: Color(0xff00E334),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'w700',
                      ),
                    ),
            ),
          ),
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
    );
  }
}
