import 'dart:async';

import 'package:flutter/material.dart';

class LoadingText extends StatefulWidget {
  const LoadingText({super.key});

  @override
  State<LoadingText> createState() => _LoadingTextState();
}

class _LoadingTextState extends State<LoadingText> {
  final List<String> _dots = ['', '.', '..', '...'];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 400), (timer) {
      if (!mounted) return;
      setState(() {
        _index = (_index + 1) % _dots.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Loading${_dots[_index]}',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'w700',
      ),
    );
  }
}
