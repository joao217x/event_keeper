import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthClientInterface {
  Future<UserCredential> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}
