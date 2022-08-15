import '../data_sources/auth_data_source.dart';

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
    try {
      await authDataSource.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
