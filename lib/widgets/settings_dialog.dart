import 'dart:ui';

import 'package:flutter/material.dart';

import 'button.dart';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Button(
                      title: 'SOUND',
                      switcher: true,
                    ),
                    SizedBox(height: 20),
                    _Button(
                      title: 'MUSIC',
                      switcher: true,
                    ),
                    SizedBox(height: 20),
                    _Button(
                      title: 'PRIVACY',
                      onPressed: () {},
                    ),
                    SizedBox(height: 20),
                    _Button(
                      title: 'TERMS OF USE',
                      onPressed: () {},
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

class _Button extends StatefulWidget {
  const _Button({
    required this.title,
    this.onPressed,
    this.switcher = false,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool switcher;

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: widget.switcher ? null : widget.onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff212534),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xff1B1E27),
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'w700',
                ),
              ),
              Spacer(),
              if (widget.switcher)
                Button(
                  onPressed: () {
                    setState(() {
                      active = !active;
                    });
                  },
                  minSize: 40,
                  child: Container(
                    height: 24,
                    width: 42,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff616883),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff2C3247),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          top: 2,
                          left: active ? 21 : 3,
                          duration: Duration(milliseconds: 400),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            height: 19,
                            width: 19,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: active
                                  ? Color(0xffFF2626)
                                  : Color(0xff266BFF),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff2C3247),
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
