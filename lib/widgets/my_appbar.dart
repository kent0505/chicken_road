import 'package:flutter/material.dart';

import 'rounded_button.dart';
import 'settings_dialog.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
    this.title = '',
    this.timer = false,
  });

  final String title;
  final bool timer;

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
                  ? Container()
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
