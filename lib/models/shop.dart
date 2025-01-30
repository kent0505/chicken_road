import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Shop {
  Shop({
    required this.id,
    required this.price,
    required this.bought,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final int price;
  @HiveField(2)
  bool bought;
}

class ShopAdapter extends TypeAdapter<Shop> {
  @override
  final typeId = 0;

  @override
  Shop read(BinaryReader reader) {
    return Shop(
      id: reader.readInt(),
      price: reader.readInt(),
      bought: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Shop obj) {
    writer.writeInt(obj.id);
    writer.writeInt(obj.price);
    writer.writeBool(obj.bought);
  }
}
