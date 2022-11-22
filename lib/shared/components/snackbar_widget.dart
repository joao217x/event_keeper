import 'package:another_flushbar/flushbar.dart';
import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';

class SnackbarLogin {
  static final invalidEmailFormat = Flushbar(
    message: 'E-mail com formato inválido',
    messageColor: Colors.black,
    icon: const Icon(
      Icons.clear,
      color: Colors.red,
    ),
    margin: const EdgeInsets.all(16),
    leftBarIndicatorColor: Colors.red,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(12),
    borderColor: Colors.grey,
    duration: const Duration(seconds: 3),
  );

  static final wrongPassword = Flushbar(
    message: 'Senha incorreta',
    messageColor: Colors.black,
    icon: const Icon(
      Icons.clear,
      color: Colors.red,
    ),
    margin: const EdgeInsets.all(16),
    leftBarIndicatorColor: Colors.red,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(12),
    borderColor: Colors.grey,
    duration: const Duration(seconds: 3),
  );

  static final userNotFound = Flushbar(
    message: 'Usuário não encontrado',
    messageColor: Colors.black,
    icon: const Icon(
      Icons.clear,
      color: Colors.red,
    ),
    margin: const EdgeInsets.all(16),
    leftBarIndicatorColor: Colors.red,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(12),
    borderColor: Colors.grey,
    duration: const Duration(seconds: 3),
  );

  static final generic = Flushbar(
    message: 'E-mail e/ou senha incorreto(s)',
    messageColor: Colors.black,
    icon: const Icon(
      Icons.clear,
      color: Colors.red,
    ),
    margin: const EdgeInsets.all(16),
    leftBarIndicatorColor: Colors.red,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(12),
    borderColor: Colors.grey,
    duration: const Duration(seconds: 3),
  );
}

class SnackbarSaveEvent {
  static final success = Flushbar(
    message: 'Seu evento foi salvo com sucesso',
    messageColor: Colors.black,
    icon: const Icon(
      Icons.check_circle,
      color: AppColor.green,
    ),
    margin: const EdgeInsets.all(16),
    leftBarIndicatorColor: AppColor.green,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(4),
    boxShadows: const [
      BoxShadow(color: Colors.black),
    ],
    duration: const Duration(seconds: 3),
  );

  static final error = Flushbar(
    message: 'Ocorreu um erro ao salvar um evento, por favor tente novamente',
    messageColor: Colors.black,
    icon: const Icon(
      Icons.clear,
      color: AppColor.red,
    ),
    margin: const EdgeInsets.all(16),
    leftBarIndicatorColor: AppColor.red,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(4),
    boxShadows: const [
      BoxShadow(color: Colors.black),
    ],
    duration: const Duration(seconds: 3),
  );
}
