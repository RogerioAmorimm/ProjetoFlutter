import 'package:dio/dio.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/core/login/entity/refresh_token.dart';
import 'package:projetoflutter/core/login/entity/usuario_autenticado_entity.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/cliente_http.dart';

class LoginService {
  Future<UsuarioAutenticadoEntity> autenticar(LoginData loginData) async {
    try {
      final client = await ClientHttp.getClient();
      final response = await client.post('Usuario/login',
          data: {'username': loginData.name, 'password': loginData.password});

      final usuario = UsuarioAutenticadoEntity.fromJson(response.data);
      return usuario;
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      throw Exception(Constants.mensagemErroInterno);
    } catch (error) {
      throw Exception(Constants.mensagemErroInterno);
    }
  }
   Future<void> refreshToken() async {
    try {
      final usuarioLocal = locator<UsuarioController>().getUsuarioLogado();
      final client = await ClientHttp.getClient();
      final response = await client.put(
        'token/refresh',
        data: {
          'oldToken': usuarioLocal!.token,
        },
      );

      final refreshToken = RefreshTokenModel.fromJson(response.data);
      usuarioLocal.token = refreshToken.token;
      await locator<UsuarioController>().setUsuarioLogado(usuarioLocal);
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      throw Exception(Constants.mensagemErroInterno);
    } catch (error) {
      throw Exception(Constants.mensagemErroInterno);
    }
  }
}
