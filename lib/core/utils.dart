import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/shop.dart';

int background = 1;
int coins = 100;
bool onboard = true;
List<String> stats = [];

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  background = prefs.getInt('background') ?? 1;
  coins = prefs.getInt('coins') ?? 1000;
  onboard = prefs.getBool('onboard') ?? true;
  stats = prefs.getStringList('stats') ?? [];
}

Future<void> saveInt(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
}

Future<void> saveBool(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

Future<void> saveStringList(String key, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(key, value);
}

List<Shop> shopsList = [
  Shop(id: 1, price: 0, bought: true),
  Shop(id: 2, price: 250, bought: false),
  Shop(id: 3, price: 400, bought: false),
  Shop(id: 4, price: 600, bought: false),
  Shop(id: 5, price: 1000, bought: false),
  Shop(id: 6, price: 1500, bought: false),
];

Future<void> getHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ShopAdapter());
}

Future<void> getShops() async {
  final h = await Hive.openBox('chicken_road_box');
  List list = h.get('shops') ?? shopsList;
  shopsList = list.cast<Shop>();
}

Future<void> updateShops() async {
  final h = await Hive.openBox('chicken_road_box');
  h.put('shops', shopsList);
  shopsList = await h.get('shops');
}
