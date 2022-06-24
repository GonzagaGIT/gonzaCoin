import 'package:dio/dio.dart';

import '../../../environment.dart';

class CustomDioInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final optionsWithCryptoKey = options.copyWith(
      headers: {
        'X-CoinAPI-Key': Environment.keyCrypto,
      },
    );
    return super.onRequest(optionsWithCryptoKey, handler);
  }

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }
}
