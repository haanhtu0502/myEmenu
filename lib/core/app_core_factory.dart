import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:emenu/core/networking/custom_log_interceptor.dart';
import 'package:emenu/core/networking/token_interceptor.dart';
import 'package:flutter/foundation.dart';

const kWithoutOrgBranch = ["/app/api/v1/products/saveAll"];

class AppCoreFactory {
  static Dio createDio(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          "content-type": "application/json",
          "Accept": "*/*",
          "Access-Control-Allow-Origin": "*",
        },
      ),
    )
      ..interceptors.add(TokenInterceptor())
      ..interceptors
          .add(CustomInterceptorLog(requestBody: true, responseBody: true));
    if (!kIsWeb) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }
}
