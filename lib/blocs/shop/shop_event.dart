part of 'shop_bloc.dart';

@immutable
sealed class ShopEvent {}

class LoadShop extends ShopEvent {}

class TapItem extends ShopEvent {
  TapItem({required this.shop});

  final Shop shop;
}

class BuyItem extends ShopEvent {
  BuyItem({required this.shop});

  final Shop shop;
}

class SelectItem extends ShopEvent {
  SelectItem({required this.shop});

  final Shop shop;
}
