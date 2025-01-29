import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/shop/shop_bloc.dart';
import '../core/utils.dart';
import '../models/shop.dart';
import 'button.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        if (state is ShopLoaded) {
          return Button(
            onPressed: state.shop.id == shop.id
                ? null
                : () {
                    context.read<ShopBloc>().add(TapItem(shop: shop));
                  },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: 200,
              width: MediaQuery.of(context).size.width / 3 - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: state.shop.id == shop.id
                    ? Border.all(
                        width: 2,
                        color: Colors.white,
                      )
                    : null,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/bg/bg${shop.id}.png',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0),
                              Color(0xff253969),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!shop.bought)
                    Positioned(
                      bottom: 6,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/coin.png',
                            height: 10,
                          ),
                          SizedBox(width: 4),
                          Text(
                            shop.price.toString(),
                            style: TextStyle(
                              color: Color(0xffBEBEBE),
                              fontSize: 12,
                              fontFamily: 'w400',
                            ),
                          ),
                        ],
                      ),
                    ),
                  Positioned(
                    bottom: 26,
                    left: 0,
                    right: 0,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 400),
                      opacity: background == shop.id ? 1 : 0,
                      child: Center(
                        child: Text(
                          'SELECTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'w700',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
