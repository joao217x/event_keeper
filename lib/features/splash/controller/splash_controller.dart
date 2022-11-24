import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashController {
  void checkLogged(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.popAndPushNamed(context, '/home')
          : Navigator.popAndPushNamed(context, '/login');
    });
  }
}
