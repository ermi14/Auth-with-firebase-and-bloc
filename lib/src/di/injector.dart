import 'package:firebase_auth/firebase_auth.dart';

import 'package:get_it/get_it.dart';
import 'package:test_task/src/data/data_sources/auth_data_source.dart';

import '../data/repositories/auth_repository.dart';
import '../presentation/auth/blocs/login/login_bloc.dart';
import '../presentation/auth/blocs/signup/signup_bloc.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {

  /// Blocs
  sl.registerLazySingleton(() => LoginBloc(authRepository: sl()));
  sl.registerLazySingleton(() => SignupBloc(authRepository: sl()));

  /// Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepository(authDataSource: sl()));

  /// Data sources
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(firebaseAuth: sl()));

  /// FirebaseAuth instance
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
}