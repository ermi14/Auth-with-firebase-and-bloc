class AuthDataSource {
  AuthDataSource authDataSource = AuthDataSource();

  Future<void> signInWithEmail({
    required String email,
    required String password
  }) async {
    await authDataSource.signInWithEmail(email: email, password: password);
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password
  }) async {
    await authDataSource.signUpWithEmail(email: email, password: password);
  }

  Future<void> resetPassword({
    required String code,
    required String newPassword
  }) async {
    await authDataSource.resetPassword(code: code, newPassword: newPassword);
  }

  Future<void> forgotPassword({
    required String email
    }) async {
    await authDataSource.forgotPassword(email: email);
  }

  Future<void> signOut() async {
    await authDataSource.signOut();
  }
}