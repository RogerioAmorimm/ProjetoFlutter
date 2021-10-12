import 'package:dio/dio.dart';

class InterceptadorDio extends InterceptorsWrapper {
  @override
  Future onRequest() {
    super.onRequest(options, handler);
  }

  @override
  Future onError() {
    super.onError(err, handler);
  }
}
