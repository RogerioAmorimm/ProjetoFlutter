import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projetoflutter/utils/http/interceptador/interceptador_dio.dart';

class ClientHttp extends DioForNative {
  ClientHttp([BaseOptions? options]) : super(options) {
    interceptors.add(InterceptadorDio());
  }

  static Future<ClientHttp> getClient() async =>
      Connectivity().checkConnectivity().then((connectivityResult) {
        if (connectivityResult == ConnectivityResult.none)
          throw Exception("Erro de conexão");

        final options = BaseOptions();
        options.baseUrl = dotenv.env['URL_BASE'] ?? '';
        final ClientHttp dio = ClientHttp(options);
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
        return dio;
      }).catchError((e) => throw e);
}
