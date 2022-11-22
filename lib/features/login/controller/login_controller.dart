import 'package:event_keeper/features/login/service/interface/firebase_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final FirebaseServiceInterface firebase;

  _LoginControllerBase({required this.firebase});

  @action
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await firebase.login(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  @action
  Future<void> logout() async {
    try {
      await firebase.logout();
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  void setPassword(String value) => password = value;

  @observable
  bool isHidden = true;
  @action
  void togglePasswordVisibility() {
    isHidden = !isHidden;
  }

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;
}
