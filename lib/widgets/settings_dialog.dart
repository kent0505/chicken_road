import 'dart:ui';

import 'package:flutter/material.dart';

import 'main_button.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            SizedBox(height: 20 + MediaQuery.of(context).viewPadding.top),
            SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  'SETTINGS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'w700',
                  ),
                ),
              ),
            ),
            Spacer(),
            Opacity(
              opacity: 0.6,
              child: Container(
                height: 400,
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
            Spacer(),
            MainButton(
              title: 'OK',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
