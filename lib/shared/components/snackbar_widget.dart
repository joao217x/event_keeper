import 'package:another_flushbar/flushbar.dart';
import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';

class SnackbarForgetPassword {
  static final success = Flushbar(
    message: 'Seu link de recuperação foi enviado para o e-mail informado',
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
      BoxShadow(
        color: Colors.black,
      ),
    ],
    duration: const Duration(seconds: 3),
  );

  static final error = Flushbar(
    message:
        'Ocorreu um erro ao enviar o e-mail de recuperação, tente novamente',
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
      BoxShadow(
        color: Colors.black,
      ),
    ],
    duration: const Duration(seconds: 3),
  );
}

class SnackbarAddEvent {
  static final success = Flushbar(
    message: 'Seu evento foi adicionado com sucesso',
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
      BoxShadow(
        color: Colors.black,
      ),
    ],
    duration: const Duration(seconds: 3),
  );

  static final error = Flushbar(
    message:
        'Ocorreu um erro ao adicionar um evento, por favor tente novamente',
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
      BoxShadow(
        color: Colors.black,
      ),
    ],
    duration: const Duration(seconds: 3),
  );
}

class SnackbarCep {
  static final error = Flushbar(
    message:
        'Ocorreu um erro ao carregar os dados do CEP informado',
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
      BoxShadow(
        color: Colors.black,
      ),
    ],
    duration: const Duration(seconds: 3),
  );
}
