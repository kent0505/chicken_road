import 'dart:async';

import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../widgets/button.dart';
import '../widgets/correct_dialog.dart';
import '../widgets/main_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_scaffold.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int corrects = 0;
  Answer selected = defaultAnswer;
  int seconds = 10;
  Timer? _timer;

  void resetState() {
    setState(() {
      index = 0;
      corrects = 0;
      seconds = 10;
      selected = defaultAnswer;
      farmQuizzes.shuffle();
      for (Quiz quiz in farmQuizzes) {
        quiz.answers.shuffle();
      }
    });
    startTimer();
  }

  void restartTimer() async {
    if (index == 14) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CorrectDialog(corrects: corrects);
        },
      );
      resetState();
    } else {
      setState(() {
        index++;
        seconds = 10;
      });
      startTimer();
    }
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
        restartTimer();
      }
    });
  }

  void onAnswer(Answer value) {
    setState(() {
      selected = value;
    });
  }

  void onNext() async {
    _timer?.cancel();
    if (index == 14) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CorrectDialog(corrects: corrects);
        },
      );
      resetState();
    } else {
      setState(() {
        index++;
        if (selected.correct) corrects++;
        selected = defaultAnswer;
        seconds = 10;
      });
      startTimer();
    }
  }

  @override
  void initState() {
    super.initState();
    resetState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        children: [
          MyAppbar(
            timer: true,
            seconds: seconds,
          ),
          Spacer(),
          Text(
            'QUESTION ${index + 1}/15',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'w700',
            ),
          ),
          Spacer(),
          _QuestionCard(quiz: farmQuizzes[index]),
          Spacer(),
          Row(
            children: [
              SizedBox(width: 20),
              _AnswerButton(
                answer: farmQuizzes[index].answers[0],
                selected: selected,
                onPressed: onAnswer,
              ),
              SizedBox(width: 20),
              _AnswerButton(
                answer: farmQuizzes[index].answers[1],
                selected: selected,
                onPressed: onAnswer,
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              _AnswerButton(
                answer: farmQuizzes[index].answers[2],
                selected: selected,
                onPressed: onAnswer,
              ),
              SizedBox(width: 20),
              _AnswerButton(
                answer: farmQuizzes[index].answers[3],
                selected: selected,
                onPressed: onAnswer,
              ),
              SizedBox(width: 20),
            ],
          ),
          Spacer(),
          MainButton(
            title: 'NEXT',
            onPressed: selected.title.isEmpty ? null : onNext,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width < 380 ? 170 : 270,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.6,
            child: Container(
              height: 270,
              padding: EdgeInsets.symmetric(horizontal: 20),
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
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                quiz.question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'w700',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.answer,
    required this.selected,
    required this.onPressed,
  });

  final Answer answer;
  final Answer selected;
  final void Function(Answer) onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        onPressed(answer);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.width < 380 ? 50 : 70,
        width: MediaQuery.of(context).size.width / 2 - 30,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.6,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width / 2 - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 3,
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
                      offset: Offset(0, 4),
                      color: Color(0xff464866),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                answer.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: answer.title == selected.title
                      ? Color(0xff00E334)
                      : Colors.white,
                  fontSize: 18,
                  fontFamily: 'w500',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
