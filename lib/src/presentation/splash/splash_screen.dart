import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = "/splash_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash screen")),
    );
  }
}