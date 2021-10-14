import 'dart:convert';

import 'package:projetoflutter/core/exception/mensagem_erro.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/sharedPreference/shared_preferences_util.dart';

mixin GerenciadorDeErro {
  static Future trate(Object erro) async {
    final usuarioController = locator<UsuarioController>();
    final mensagemDeErro = MensagemErro(
        mensagem: erro is ValidacaoServer ? erro.mensagem : erro.toString(),
        dataHora: DateTime.now().toString(),
        id: usuarioController.getUsuarioLogado()!.id.toString());

    await SharedPreferenceUtil.setString(
        Constants.mesagemErro, jsonEncode(mensagemDeErro.toJson()));
  }
}
