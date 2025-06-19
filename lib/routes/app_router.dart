import 'package:flutter/material.dart';
import 'package:duolingo/stack/main_stack_onboarding.dart';
import 'package:duolingo/auth/forgot_password_screen.dart';
import 'package:duolingo/auth/enter_otp_screen.dart';
import 'package:duolingo/auth/reset_password_screen.dart';
import 'package:duolingo/stack/main_stack.dart'; // chứa MainStackNavigation
import 'package:duolingo/auth/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/main': // ✅ dùng '/main' thay vì '/'
      return MaterialPageRoute(builder: (_) => const MainStackNavigation());
    case '/onboarding':
      return MaterialPageRoute(builder: (_) => const MainStackOnBoarding());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case '/forgot-password':
      return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
    case '/enter-otp':
      return MaterialPageRoute(builder: (_) => const EnterOtpScreen());
    case '/reset-password':
      return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text("Không tìm thấy route"))),
      );
  }
}
