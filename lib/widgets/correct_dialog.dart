import 'dart:ui';

import 'package:flutter/material.dart';

import 'main_button.dart';

class CorrectDialog extends StatelessWidget {
  const CorrectDialog({super.key, required this.corrects});

  final int corrects;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20 + MediaQuery.of(context).viewPadding.top),
            SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  'FINISHED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'w700',
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 400,
              padding: EdgeInsets.symmetric(horizontal: 40),
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
              child: Center(
                child: Text(
                  'Correct answers $corrects',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'w700',
                  ),
                ),
              ),
            ),
            Spacer(),
            MainButton(
              title: 'RESTART',
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
