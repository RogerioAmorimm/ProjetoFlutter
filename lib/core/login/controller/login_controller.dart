import 'package:flutter/cupertino.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:mobx/mobx.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/core/login/service/login_service.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/splash_screen.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/routers/custom_route.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @action
  String? validarUsuario(String? usuario) {
    if (usuario == null || usuario.isEmpty) {
      return 'Usuário deve ser informado';
    }
    return null;
  }

  @action
  String? validarSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      return 'Senha deve ser informada';
    }
    return null;
  }

  @action
  Future<String> logar(LoginData loginData) async => _loginUser(loginData);
  @action
  Future<String> logado(LoginData loginData) async => _loginUser(loginData);
  @action
  Future<String> recuperarSenha(String info) => Future.value('');

  @action
  void submeterAposAnimacaoCompleta(BuildContext context) {
    Navigator.of(context).pushReplacement(
        FadePageRoute(builder: (context) => SplashScreen(), settings: null));
  }

  Future<String> _loginUser(LoginData loginData) async {
    try {
      await locator<UsuarioController>().setUsuarioLogado(null);
      final resposta = await LoginService().autenticar(loginData);

      if (!resposta.sucesso) {
        return resposta.errors.first;
      }

      await locator<UsuarioController>()
          .setUsuarioLogado(resposta.usuarioAutenticado);

      return '';
    } on ValidacaoServer catch (error) {
      return error.mensagem;
    } on Exception {
      return Constants.mensagemErroInterno;
    }
  }
}
