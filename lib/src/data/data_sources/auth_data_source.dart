import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth firebaseAuth;

  AuthDataSource({required this.firebaseAuth});

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for this email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> resetPassword(
      {required String code, required String newPassword}) async {
    try {
      await firebaseAuth.confirmPasswordReset(
          code: code, newPassword: newPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'expired-action-code') {
        throw Exception('The code you provided is expired.');
      } else if (e.code == 'user-not-found') {
        throw Exception('No user found for this email.');
      } else if (e.code == 'invalid-action-code') {
        throw Exception('The code you provided is invalid.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/user-not-found') {
        throw Exception('No user found for this email.');
      } else if (e.code == 'user-not-found') {
        throw Exception('No user found for this email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
