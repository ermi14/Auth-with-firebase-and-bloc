import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_task/src/core/utils/network_exception.dart';

class AuthDataSource {
  final FirebaseAuth firebaseAuth;

  AuthDataSource({required this.firebaseAuth});

  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw NetworkException('No user found for this email.');
      } else if (e.code == 'wrong-password') {
        throw NetworkException('Wrong password provided for that user.');
      } else {
        throw NetworkException(e.code);
      }
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  Future<void> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw NetworkException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw NetworkException('An account already exists for that email.');
      } else {
        throw NetworkException(e.code);
      }
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/user-not-found') {
        throw NetworkException('No user found for this email.');
      } else if (e.code == 'user-not-found') {
        throw NetworkException('No user found for this email.');
      } else {
        throw NetworkException(e.code);
      }
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
