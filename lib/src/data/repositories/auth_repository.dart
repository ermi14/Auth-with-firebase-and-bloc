import '../data_sources/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});

  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await authDataSource.signInWithEmail(email: email, password: password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await authDataSource.signUpWithEmail(email: email, password: password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> resetPassword(
      {required String code, required String newPassword}) async {
    try {
      await authDataSource.resetPassword(code: code, newPassword: newPassword);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await authDataSource.forgotPassword(email: email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await authDataSource.signOut();
      await prefs.setBool("isLoggedIn", false);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
