import 'package:flutter/material.dart';
import 'package:test_task/src/data/repositories/auth_repository.dart';
import 'package:test_task/src/presentation/auth/screens/login_screen.dart';

import '../../di/injector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to your home page",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: InkWell(
              onTap: () async {
                await sl<AuthRepository>().signOut();
                if (!mounted) return;
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
