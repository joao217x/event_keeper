import 'package:event_keeper/shared/client/auth/interface/auth_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClientImpl implements AuthClientInterface {
  final FirebaseAuth client;

  FirebaseClientImpl({required this.client});

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await client.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await client.signOut();
  }
}
