import 'dart:developer';

import 'package:dio/dio.dart';

import '../constant/auth_token.dart';

String baseUrl = "https://api.sendchamp.com/api/v1";

connectBaseApi() {
  BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
      responseType: ResponseType.plain);
  Dio dio = Dio(options);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Authorization'] = "Bearer $token";
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log('response: ${response.statusCode}');
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ),
  );

  return dio;
}
