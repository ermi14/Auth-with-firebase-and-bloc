import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          color: Colors.deepPurple,
          height: size.height,
          width: size.width,
          child: Center(
              child: InkWell(
                onTap: () {
                  /// TODO: write logout logic here
                },
                child: const Text("Logout",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ))),
    );
  }
}