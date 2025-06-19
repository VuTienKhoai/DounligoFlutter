import 'package:duolingo/main_app/home_screen.dart';
import 'package:flutter/material.dart';

class MainStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          // case 'profile':
          //   return MaterialPageRoute(builder: (_) => ProfileScreen());
          default:
            return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
    );
  }
}
