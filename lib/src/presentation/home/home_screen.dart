import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Home screen")),
    );
  }
}