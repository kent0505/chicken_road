import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/shop/shop_bloc.dart';
import '../core/utils.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<ShopBloc, ShopState>(
            builder: (context, state) {
              // return AnimatedSwitcher(
              //   duration: Duration(seconds: 1),
              //   transitionBuilder: (widget, animation) {
              //     return FadeTransition(opacity: animation, child: widget);
              //   },
              //   child: Image.asset(
              //     'assets/bg/bg$background.png',
              //     width: double.infinity,
              //     fit: BoxFit.fitWidth,
              //     key: ValueKey<bool>(
              //       state is ShopLoaded && state.shop.id == background,
              //     ),
              //   ),
              // );
              return Image.asset(
                'assets/bg/bg$background.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              );
            },
          ),
          body,
        ],
      ),
    );
  }
}
