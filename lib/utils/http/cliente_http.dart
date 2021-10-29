import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/utils/http/interceptador/interceptador_dio.dart';

class ClientHttp extends DioForNative {
  ClientHttp([BaseOptions? options]) : super(options) {
    interceptors.add(InterceptadorDio());
  }

  static Future<ClientHttp> getClient() async =>
      Connectivity().checkConnectivity().then((connectivityResult) {
        if (connectivityResult == ConnectivityResult.none) {
          throw ValidacaoServer.erroConexao();
        }
        final options = BaseOptions();
        options.baseUrl = dotenv.env['URL_BASE'] ?? '';
        final ClientHttp dio = ClientHttp(options);
        dio.httpClientAdapter = BrowserHttpClientAdapter();
        return dio;
      }).catchError((e) => throw e);
}
