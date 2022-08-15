import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_task/src/presentation/splash/splash_screen.dart';
import 'package:test_task/src/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'PDF Scanner',
        theme: const CupertinoThemeData(
          primaryColor: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGeneratedRouteIos,
        initialRoute: SplashScreen.routeName,
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PDF Scanner',
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        onGenerateRoute: appRouter.onGeneratedRoute,
        initialRoute: SplashScreen.routeName,
      );
    }
  }
}