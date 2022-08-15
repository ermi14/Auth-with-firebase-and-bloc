import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:test_task/src/presentation/auth/screens/login_screen.dart';
import 'package:test_task/src/presentation/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Timer(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("isLoggedIn") &&
          prefs.getBool("isLoggedIn") == true) {
        if (!mounted) return;
        await Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      } else {
        await prefs.setBool("isLoggedIn", false);
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }
    });

    return Scaffold(
      body: Container(
          color: Colors.blue,
          height: size.height,
          width: size.width,
          child: const Center(
              child: Text("Splash screen",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
    );
  }
}
