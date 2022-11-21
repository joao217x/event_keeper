import 'package:event_keeper/features/login/service/interface/firebase_service_interface.dart';
import 'package:event_keeper/shared/client/firebase/interface/firebase_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService implements FirebaseServiceInterface {
  // final firebaseClient = FirebaseAuth.instance;

  final FirebaseAuth firebaseClient;
  final FirebaseClientInterface firebaseClient;

  FirebaseService({required this.firebaseClient});

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseClient.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseClient.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    }
  }
}
