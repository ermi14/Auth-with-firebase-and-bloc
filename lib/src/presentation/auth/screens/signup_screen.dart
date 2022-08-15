import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String routeName = "/signup_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Signup screen")),
    );
  }
}