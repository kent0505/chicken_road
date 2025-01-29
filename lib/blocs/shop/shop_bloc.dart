import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils.dart';
import '../../models/shop.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial()) {
    on<LoadShop>((event, emit) async {
      await Future.delayed(Duration(seconds: 1));
      emit(ShopLoading());

      await initHive();
      await getShops();
      await getData();

      await Future.delayed(Duration(seconds: 4), () {
        emit(ShopLoaded(shop: shopsList[0]));
      });
    });

    on<TapItem>((event, emit) async {
      emit(ShopLoaded(shop: event.shop));
    });

    on<BuyItem>((event, emit) async {
      coins -= event.shop.price;
      background = event.shop.id;
      final shop = shopsList.firstWhere((x) => x.id == event.shop.id);
      shop.bought = true;
      await updateShops();
      await saveInt('coins', coins);
      await saveInt('background', background);
      emit(ShopLoaded(shop: event.shop));
    });

    on<SelectItem>((event, emit) async {
      background = event.shop.id;
      await saveInt('background', background);
      emit(ShopLoaded(shop: event.shop));
    });
  }
}
