import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'button.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.asset,
    required this.onPressed,
  });

  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
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
              offset: Offset(0, 4),
              color: Color(0xff464866),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset('assets/$asset.svg'),
        ),
      ),
    );
  }
}
