import 'package:flutter/material.dart';

import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.price = 0,
  });

  final String title;
  final VoidCallback onPressed;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Container(
        height: 70,
        width: 200,
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: price == 0
                ? Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'w700',
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'w700',
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/coin.png',
                        height: 30,
                      ),
                      SizedBox(width: 4),
                      Text(
                        price.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'w700',
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
