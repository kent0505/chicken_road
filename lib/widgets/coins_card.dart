import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/shop/shop_bloc.dart';
import '../core/utils.dart';

class CoinsCard extends StatelessWidget {
  const CoinsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/coin.png',
                height: 20,
              ),
              SizedBox(width: 6),
              BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  return Text(
                    coins.toString(),
                    // '100000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'w500',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
