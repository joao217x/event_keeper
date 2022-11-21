import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseClientInterface {
  Future<UserCredential> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}
