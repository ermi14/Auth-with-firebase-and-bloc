import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmail({
    required String email,
    required String password
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> resetPassword({
    required String code,
    required String newPassword
  }) async {
    await _firebaseAuth.confirmPasswordReset(code: code, newPassword: newPassword);
  }

  Future<void> forgotPassword({
    required String email
    }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}