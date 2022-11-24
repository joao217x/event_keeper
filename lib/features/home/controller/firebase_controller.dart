import 'dart:async';

import 'package:event_keeper/features/home/service/firebase/interface/firebase_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseController extends ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  final FirebaseServiceInterface firebase;

  FirebaseController({
    required this.firebaseAuth,
    required this.firebase,
  });

  Future<void> logout() async {
    await firebase.logout();
    setIsLogged(false);
    notifyListeners();
  }

  bool isLogged = false;
  void setIsLogged(bool value) {
    isLogged = value;
    notifyListeners();
  }

  void checkLoggedSplash(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.popAndPushNamed(context, '/home')
          : Navigator.popAndPushNamed(context, '/login');
    });
    setIsLogged(true);
    notifyListeners();
  }

  void checkLogged() {
    if (firebaseAuth.currentUser != null) {
      setIsLogged(true);
      notifyListeners();
    } else {
      setIsLogged(false);
      notifyListeners();
    }
  }
}
