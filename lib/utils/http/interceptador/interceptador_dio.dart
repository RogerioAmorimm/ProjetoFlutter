import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:projetoflutter/core/login/controller/login_controller.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/core/usuario/entity/usuario_entity.dart';
import 'package:projetoflutter/ioc/service_locator.dart';

class InterceptadorDio extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final usuario = _getUsuario();

    if (usuario?.token != null && usuario!.token.isNotEmpty) {
      final headerAuth = _getToken(usuario.token);
      options.headers['Authorization'] = headerAuth;
    }
    if (kDebugMode) {
      debugPrint(json.encode('BaseURL: ${options.baseUrl}'));
      debugPrint(json.encode('Endpoint: ${options.path}'));
      if (options.headers['Authorization'] != null) {
        debugPrint("Authorization: ${options.headers['Authorization']}");
      }
      if (options.data != null) {
        debugPrint('Payload ${json.encode(options.data)}');
      }
    }

    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response!.statusCode == 401) {
      final dio = DioForNative();
      final usuario = _getUsuario();
      if (usuario != null &&
          err.response!.statusCode == 401 &&
          usuario.senha != '') {
        final options = err.response!.requestOptions;

        if (usuario.token == options.headers['Authorization']) {
          options.headers['Authorization'] = usuario.token;
          return dio.request(options.path);
        }
        dio.lock();
        dio.interceptors.responseLock.lock();
        dio.interceptors.errorLock.lock();

        final loginController = locator<LoginController>();
        return loginController
            .logar(LoginData(name: usuario.usuario, password: usuario.senha))
            .then(
          (result) {
            final _newToken = usuario.token;

            if (_newToken.isNotEmpty) {
              final headerAuth = _getToken(_newToken);
              options.headers['Authorization'] = headerAuth;
            }
          },
        ).whenComplete(() {
          dio.unlock();
          dio.interceptors.responseLock.unlock();
          dio.interceptors.errorLock.unlock();
        }).then((e) => dio.request(options.path));
      }
    } else {
      super.onError(err, handler);
    }
  }

  UsuarioEntity? _getUsuario() {
    final usuarioController = locator<UsuarioController>();
    return usuarioController.getUsuarioLogado();
  }

  String _getToken(String token) => 'Bearer $token';
}
