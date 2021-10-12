import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:projetoflutter/core/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/auth';
  final LoginController controller;
  const LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        theme: LoginTheme(primaryColor: Theme.of(context).primaryColor),
        hideForgotPasswordButton: true,
        hideSignUpButton: true,
        loginAfterSignUp: false,
        disableCustomPageTransformer: false,
        showDebugButtons: false,
        messages: LoginMessages(
          userHint: 'Usuário',
          passwordHint: 'Senha',
          loginButton: 'Logar',
          goBackButton: 'Voltar',
          flushbarTitleError: 'Ops, algo deu errado!',
          flushbarTitleSuccess: 'Sucesso!',
        ),
        userValidator: controller.validarUsuario,
        passwordValidator: controller.validarSenha,
        onSignup: controller.logado,
        onLogin: controller.logar,
        onSubmitAnimationCompleted: () {
          controller.submeterAposAnimacaoCompleta(context);
        },
        onRecoverPassword: (valor) {});
  }
}
