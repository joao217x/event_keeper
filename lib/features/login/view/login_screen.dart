import 'dart:developer';
import 'package:event_keeper/features/login/controller/errors/errors_controller.dart';
import 'package:event_keeper/features/login/controller/login_controller.dart';
import 'package:event_keeper/shared/components/elevated_button_widget.dart';
import 'package:event_keeper/shared/components/loading_widget.dart';
import 'package:event_keeper/shared/components/txt_form_field_widget.dart';
import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:event_keeper/shared/service_locator/app_dependencies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = getIt<LoginController>();

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Observer(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  _logoAndLogin(),
                  _emailField(),
                  _passwordField(),
                  _loginButton(context),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _logoAndLogin() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 128, bottom: 8),
          child: SvgPicture.asset('assets/logo.svg'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            'LOGIN',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColor.purple,
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TxtFormFieldWidget(
        labelText: 'E-mail',
        keyboardType: TextInputType.emailAddress,
        onChanged: (String value) {
          controller.setEmail(value);
        },
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextFormField(
        obscureText: controller.isHidden,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: 'Senha',
          suffixIcon: IconButton(
            onPressed: () {
              controller.togglePasswordVisibility();
            },
            icon: controller.isHidden
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
        ),
        onChanged: (String value) {
          controller.setPassword(value);
        },
      ),
    );
  }

  Widget _loginButton(context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButtonWidget(
            child: controller.isLoading == true
                ? LoadingWidget.loading
                : const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            onPressed: () async {
              controller.setIsLoading(true);
              try {
                final result = await controller.login(
                  email: controller.email,
                  password: controller.password,
                );
                if (result.runtimeType == UserCredential) {
                  Navigator.popAndPushNamed(context, '/home');
                }
              } on Exception catch (e) {
                log(e.toString());
                await ErrorsController.errorSnackbar(e, context);
              }
              controller.setIsLoading(false);
            },
          ),
        ),
      ],
    );
  }
}
