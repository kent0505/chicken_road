import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/shop/shop_bloc.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/items/item1.png'), context);
    precacheImage(AssetImage('assets/bg/bg0.png'), context);
    precacheImage(AssetImage('assets/bg/bg1.png'), context);
    precacheImage(AssetImage('assets/bg/bg2.png'), context);
    precacheImage(AssetImage('assets/bg/bg3.png'), context);
    precacheImage(AssetImage('assets/bg/bg4.png'), context);
    precacheImage(AssetImage('assets/bg/bg5.png'), context);
    precacheImage(AssetImage('assets/bg/bg6.png'), context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopBloc()..add(LoadShop())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Color(0xff252a3c),
          brightness: Brightness.dark,
        ),
        home: SplashPage(),
      ),
    );
  }
}
