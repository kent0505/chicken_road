class Item {
  Item({
    required this.id,
    required this.index,
    required this.active,
    required this.done,
  });

  final int id;
  final int index;
  bool active;
  bool done;
}
