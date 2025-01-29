import 'package:flutter/material.dart';

import '../widgets/main_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_scaffold.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        children: [
          MyAppbar(timer: true),
          Spacer(),
          // question number
          SizedBox(height: 20),
          // question card
          SizedBox(height: 20),
          // answer cards row
          SizedBox(height: 20),
          // answer cards row
          Spacer(),
          MainButton(
            title: 'NEXT',
            onPressed: () {},
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
