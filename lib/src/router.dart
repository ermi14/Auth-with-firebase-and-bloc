import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/src/presentation/auth/screens/forgot_password_screen.dart';
import 'package:test_task/src/presentation/auth/screens/login_screen.dart';
import 'package:test_task/src/presentation/auth/screens/signup_screen.dart';
import 'package:test_task/src/presentation/home/home_screen.dart';
import 'package:test_task/src/presentation/splash/splash_screen.dart';

class AppRouter {
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case SignupScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }

  CupertinoPageRoute? onGeneratedRouteIos(RouteSettings routeSettings){
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case LoginScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case SignupScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const SignupScreen());
      case ForgotPasswordScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const ForgotPasswordScreen());
      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}