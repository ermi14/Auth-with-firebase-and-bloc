import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth firebaseAuth;

  AuthDataSource({required this.firebaseAuth});

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> signInWithEmail({
    required String email,
    required String password
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password
  }) async {
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> resetPassword({
    required String code,
    required String newPassword
  }) async {
    await firebaseAuth.confirmPasswordReset(code: code, newPassword: newPassword);
  }

  Future<void> forgotPassword({
    required String email
    }) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}