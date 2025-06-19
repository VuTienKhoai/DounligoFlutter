import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duolingo/providers/app_state.dart';
import 'package:duolingo/core/refresh_control.dart';
import 'routes/app_router.dart'; // chứa generateRoute

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => RefreshController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duolingo Clone',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/onboarding', // ✅ app bắt đầu từ onboarding
      onGenerateRoute: generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
