import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/shop/shop_bloc.dart';
import '../core/utils.dart';
import '../widgets/coins_card.dart';
import '../widgets/main_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_scaffold.dart';
import '../widgets/shop_item.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        children: [
          MyAppbar(title: 'SHOP'),
          SizedBox(height: 20),
          CoinsCard(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              ShopItem(shop: shopsList[0]),
              SizedBox(width: 20),
              ShopItem(shop: shopsList[1]),
              SizedBox(width: 20),
              ShopItem(shop: shopsList[2]),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              ShopItem(shop: shopsList[3]),
              SizedBox(width: 20),
              ShopItem(shop: shopsList[4]),
              SizedBox(width: 20),
              ShopItem(shop: shopsList[5]),
              SizedBox(width: 20),
            ],
          ),
          Spacer(),
          BlocBuilder<ShopBloc, ShopState>(
            builder: (context, state) {
              if (state is ShopLoaded && state.shop.price <= coins) {
                return MainButton(
                  title: state.shop.bought ? 'SELECT' : 'BUY',
                  price: state.shop.bought ? 0 : state.shop.price,
                  onPressed: () {
                    context.read<ShopBloc>().add(
                          state.shop.bought
                              ? SelectItem(shop: state.shop)
                              : BuyItem(shop: state.shop),
                        );
                  },
                );
              }

              return Container();
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
