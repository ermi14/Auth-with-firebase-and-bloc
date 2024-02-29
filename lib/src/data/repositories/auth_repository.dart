import 'package:test_task/src/core/utils/network_exception.dart';

import '../data_sources/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});

  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await authDataSource.signInWithEmail(email: email, password: password);
    } on NetworkException catch(e) {
      throw NetworkException(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await authDataSource.signUpWithEmail(email: email, password: password);
    } on NetworkException catch(e) {
      throw NetworkException(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await authDataSource.forgotPassword(email: email);
    } on NetworkException catch(e) {
      throw NetworkException(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await authDataSource.signOut();
      await prefs.setBool("isLoggedIn", false);
    } on NetworkException catch(e) {
      throw NetworkException(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
