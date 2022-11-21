import 'package:event_keeper/shared/client/firebase/interface/firebase_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseImpl implements FirebaseClientInterface {
  final client = FirebaseAuth.instance;

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
