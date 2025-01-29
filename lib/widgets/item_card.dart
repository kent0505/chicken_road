import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 3 - 30,
      width: MediaQuery.of(context).size.width / 3 - 30,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 4,
          color: Color(0xff6E78B3),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff585E81),
            Color(0xff43466E),
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            color: Color(0xff464866),
          ),
        ],
      ),
      child: Center(
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(id == 2 ? -20 / 360 : 0 / 360),
          child: Image.asset('assets/items/item$id.png'),
        ),
      ),
    );
  }
}
