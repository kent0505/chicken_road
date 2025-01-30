import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main_button.dart';

class WinDialog extends StatelessWidget {
  const WinDialog({super.key, required this.amount});

  final int amount;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                height: 120,
                width: 300,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        height: 120,
                        width: 300,
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
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          amount == 0 ? 'TRY AGAIN!' : 'CONGRATULATIONS!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'w700',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 14,
                      left: 0,
                      right: 0,
                      child: amount == 0
                          ? Image.asset(
                              'assets/stars.png',
                              height: 50,
                            )
                          : SvgPicture.asset(
                              'assets/stars.svg',
                              height: 50,
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        height: 300,
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
                    Center(
                      child: Image.asset('assets/win.png'),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 0,
                      bottom: 70,
                      child: Image.asset(
                        'assets/items/item1.png',
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'YOU EARNED:',
                            style: TextStyle(
                              color: Color(0xffFFDF5F),
                              fontSize: 26,
                              fontFamily: 'w700',
                            ),
                          ),
                          SizedBox(width: 6),
                          Image.asset(
                            'assets/coin.png',
                            height: 30,
                          ),
                          SizedBox(width: 6),
                          Text(
                            amount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontFamily: 'w700',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              MainButton(
                title: 'OK',
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
