import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/shop/shop_bloc.dart';
import '../core/utils.dart';
import 'home_page.dart';
import 'onboard_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ShopBloc, ShopState>(
        listener: (context, state) {
          if (state is ShopLoaded) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => onboard ? OnboardPage() : HomePage(),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: state is ShopInitial ? 0 : 1,
            child: Stack(
              children: [
                Image.asset(
                  'assets/bg/bg0.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  color: Color(0xff272A3E).withValues(alpha: .5),
                ),
                Column(
                  children: [
                    Spacer(),
                    Image.asset(
                      'assets/items/item1.png',
                      height: 260,
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: Text(
                        'Loading...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'w700',
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
