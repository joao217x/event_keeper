import 'package:event_keeper/shared/service/firebase/interface/firebase_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabsHomeController {
  final FirebaseAuth firebaseAuth;
  final FirebaseServiceInterface firebaseInterface;

  TabsHomeController({
    required this.firebaseAuth,
    required this.firebaseInterface,
  });

  bool isLogged = false;

  void setIsLogged(bool value) => isLogged = value;

  void checkLogged() {
    if (firebaseAuth.currentUser != null) {
      setIsLogged(true);
    } else {
      setIsLogged(false);
    }
  }

  Future<void> logout() async {
    await firebaseInterface.logout();
    setIsLogged(false);
  }
}
