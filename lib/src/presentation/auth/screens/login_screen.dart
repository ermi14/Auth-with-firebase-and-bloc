import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/login_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Login screen")),
    );
  }
}