import 'package:event_keeper/features/login/service/interface/firebase_service_interface.dart';
import 'package:event_keeper/shared/client/firebase/interface/firebase_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServiceImpl implements FirebaseServiceInterface {
  final FirebaseClientInterface client;
  // final FirebaseAuth client;

  FirebaseServiceImpl({required this.client});

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await client.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await client.logout();
  }
}
