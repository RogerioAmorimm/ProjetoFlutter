import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/core/login/entity/login_entity.dart';
import 'package:projetoflutter/core/login/service/login_service.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/utils/constants.dart';

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
  Future<String> logar(LoginEntity loginData) async => _loginUser(loginData);
  @action
  Future<String> logado(LoginEntity loginData) async => _loginUser(loginData);
  @action
  Future<String> recuperarSenha(String info) => Future.value('');

  @action
  void submeterAposAnimacaoCompleta(BuildContext context) {
    final usuarioLogado = locator<UsuarioController>().getUsuarioLogado();
  }

  Future<String> _loginUser(LoginEntity loginData) async {
    try {
      await locator<UsuarioController>().setUsuarioLogado(null);
      final resposta = await LoginService().autenticar(loginData);

      if (!resposta.sucesso) {
        return resposta.mensagem;
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
