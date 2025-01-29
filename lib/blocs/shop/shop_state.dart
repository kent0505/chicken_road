part of 'shop_bloc.dart';

@immutable
sealed class ShopState {}

final class ShopInitial extends ShopState {}

final class ShopLoading extends ShopState {}

final class ShopLoaded extends ShopState {
  ShopLoaded({required this.shop});

  final Shop shop;
}
