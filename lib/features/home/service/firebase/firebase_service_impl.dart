import 'package:event_keeper/features/home/service/firebase/interface/firebase_service_interface.dart';
import 'package:event_keeper/shared/client/auth/interface/auth_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServiceImpl implements FirebaseServiceInterface {
  final AuthClientInterface client;

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
