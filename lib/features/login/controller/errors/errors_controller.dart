import 'dart:async';
import 'package:event_keeper/shared/components/snackbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ErrorsController {
  static Future errorSnackbar(e, BuildContext context) async {
    try {
      throw e;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return await SnackbarLogin.invalidEmailFormat.show(context);
        case 'wrong-password':
          return await SnackbarLogin.wrongPassword.show(context);
        case 'user-not-found':
          return await SnackbarLogin.userNotFound.show(context);
        default:
          return await SnackbarLogin.generic.show(context);
      }
      // if (e.code == "invalid-email") {
      //   return await SnackbarLogin.invalidEmailFormat.show(context);
      // } else if (e.code == "wrong-password") {
      //   return await SnackbarLogin.wrongPassword.show(context);
      // } else if (e.code == "user-not-found") {
      //   return await SnackbarLogin.userNotFound.show(context);
      // } else {
      //   return await SnackbarLogin.generic.show(context);
      // }
    }
  }
}
