import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/subjects.dart';
import 'package:test_task/src/data/data_sources/auth_data_source.dart';

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
          Invocation.method(#signInWithEmailAndPassword, [email, password]),
          returnValue: Future.value(MockUserCredential()));

   @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
          Invocation.method(#createUserWithEmailAndPassword, [email, password]),
          returnValue: Future.value(MockUserCredential()));

  @override
  Future<UserCredential> signOut() =>
      super.noSuchMethod(
          Invocation.method(#signOut, []),
          returnValue: Future.value(MockUserCredential()));       
}

void main() {
  late AuthDataSource authDataSource;
  late MockFirebaseAuth mockAuth;
  late MockUserCredential mockCredential;
  late MockFirebaseUser mockUser;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    mockCredential = MockUserCredential();
    mockUser = MockFirebaseUser();
    authDataSource = AuthDataSource(firebaseAuth: mockAuth);
    when(mockCredential.user).thenReturn(mockUser);
  });

  group('auth data source test', () {
    test("sign in with email and password", () async {
      when(mockAuth.signInWithEmailAndPassword(
            email: "email", password: "password"))
        .thenAnswer((realInvocation) async => Future.value(mockCredential));

      await authDataSource.signInWithEmail(email: "email", password: "password");

      verify(mockAuth.signInWithEmailAndPassword(
        email: "email", password: "password"));
    });

    
    test("create user email and password", () async {
      when(mockAuth.createUserWithEmailAndPassword(
            email: "email", password: "password"))
        .thenAnswer((realInvocation) async => Future.value(mockCredential));

      await authDataSource.signUpWithEmail(email: "email", password: "password");
      
      verify(mockAuth.createUserWithEmailAndPassword(
        email: "email", password: "password"));
    });
    

    test("sign out", () async {
      when(mockAuth.signOut())
        .thenAnswer((realInvocation) async => Future.value(mockCredential));

      await authDataSource.signOut();
      
      verify(mockAuth.signOut());
    });
  });
}
