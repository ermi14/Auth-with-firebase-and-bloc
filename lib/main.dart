import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_task/src/presentation/splash/splash_screen.dart';
import 'package:test_task/src/router.dart';
import 'src/core/utils/bloc_observer.dart';
import 'src/di/injector.dart';
import 'src/presentation/auth/blocs/login/login_bloc.dart';
import 'src/presentation/auth/blocs/signup/signup_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize firebase
  await Firebase.initializeApp();

  /// Initialize dependecy injection using get_it
  await serviceLocatorInit();

  BlocOverrides.runZoned(
      () => runApp(MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LoginBloc(authRepository: sl()),
              ),
              BlocProvider(
                create: (context) => SignupBloc(authRepository: sl()),
              ),
            ],
            child: MyApp(),
          )),
      blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Task',
        theme: const CupertinoThemeData(
          primaryColor: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGeneratedRouteIos,
        initialRoute: SplashScreen.routeName,
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Task',
        theme: ThemeData(primaryColor: Colors.blue),
        onGenerateRoute: appRouter.onGeneratedRoute,
        initialRoute: SplashScreen.routeName,
      );
    }
  }
}
