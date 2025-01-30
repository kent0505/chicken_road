import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/utils.dart';
import '../widgets/main_button.dart';
import 'home_page.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: page == 1
            ? () {
                setState(() {
                  page = 2;
                });
              }
            : null,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg/bg0.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Container(
              color: Color(0xff272A3E).withValues(alpha: .5),
            ),
            page == 1
                ? Positioned(
                    bottom: -100,
                    left: -130,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-20 / 360),
                      child: Transform.scale(
                        scaleX: -1,
                        child: Image.asset(
                          'assets/items/item1.png',
                          height: 400,
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    bottom: -88,
                    right: -96,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(20 / 360),
                      child: Image.asset(
                        'assets/items/item1.png',
                        height: 300,
                      ),
                    ),
                  ),
            if (page == 1)
              Positioned(
                left: 0,
                right: 0,
                bottom: 240,
                child: SvgPicture.asset(
                  'assets/o1.svg',
                  height: 300,
                ),
              ),
            if (page == 1)
              Positioned(
                left: 0,
                right: 0,
                bottom: 450,
                child: Center(
                  child: Text(
                    'Game info',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'w700',
                    ),
                  ),
                ),
              ),
            if (page == 2)
              Column(
                children: [
                  Spacer(),
                  Container(
                    height: 100,
                    width: 260,
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
                      child: Text(
                        'Rules',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'w700',
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      SvgPicture.asset(
                        'assets/o2.svg',
                        height: 60,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ItemCard(id: 0),
                      SizedBox(width: 20),
                      _ItemCard(id: 3),
                      SizedBox(width: 20),
                      _ItemCard(id: 0),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ItemCard(id: 0),
                      SizedBox(width: 20),
                      _ItemCard(id: 0),
                      SizedBox(width: 20),
                      _ItemCard(id: 0),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ItemCard(id: 9),
                      SizedBox(width: 20),
                      _ItemCard(id: 0),
                      SizedBox(width: 20),
                      _ItemCard(id: 0),
                    ],
                  ),
                  Spacer(),
                  MainButton(
                    title: 'GOT IT',
                    onPressed: () {
                      saveBool('onboard', false);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(height: 50),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({required this.id});

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
