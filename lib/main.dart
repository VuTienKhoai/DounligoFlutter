import 'package:duolingo/stack/auth_stack.dart';
import 'package:duolingo/stack/main_stack.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn =
      false; // Bạn có thể thay bằng Provider/Riverpod sau này

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doulinago Flutter',
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? MainStack() : AuthStack(),
    );
  }
}
