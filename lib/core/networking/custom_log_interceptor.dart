import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emenu/core/utils/logger.dart';

class CustomInterceptorLog extends Interceptor {
  CustomInterceptorLog({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logPrint('✈️✈️✈️*** Request ***✈️✈️✈️');
    _printKV('uri', options.uri, PrintType.info);
    //options.headers;

    if (request) {
      var logRequest = {
        'method': options.method,
        'path': options.path,
        'responseType': options.responseType.toString(),
        'followRedirects': options.followRedirects,
        'persistentConnection': options.persistentConnection,
        'connectTimeout': options.connectTimeout,
        'sendTimeout': options.sendTimeout,
        'receiveTimeout': options.receiveTimeout,
        'receiveDataWhenStatusError': options.receiveDataWhenStatusError,
        'extra': options.extra,
      };
      if (requestHeader) {
        logRequest['headers'] = options.headers;
      }
      if (requestBody) {
        logRequest['data'] = options.data;
      }
      const encoder = JsonEncoder.withIndent('  ');
      logPrint(encoder.convert(logRequest), printType: PrintType.info);
    }
    handler.next(options);
    logPrint('✈️✈️✈️✈️✈️✈️', printType: PrintType.info);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint('💡💡💡*** Response ***💡💡💡', printType: PrintType.log);
    logPrint('uri: ${response.requestOptions.uri}', printType: PrintType.log);
    _printResponse(response, PrintType.log);
    handler.next(response);
    logPrint('💡💡💡💡💡💡', printType: PrintType.log);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (error) {
      logPrint('🐛🐛🐛*** DioException ***:🐛🐛🐛', printType: PrintType.error);
      logPrint('uri: ${err.requestOptions.uri}', printType: PrintType.error);
      logPrint('$err', printType: PrintType.error);
      if (err.response != null) {
        _printResponse(err.response!, PrintType.error);
      }
      logPrint('🐛🐛🐛🐛🐛🐛', printType: PrintType.error);
    }

    handler.next(err);
  }

  void _printResponse(Response response, PrintType printType) {
    var logResponse = <String, Object?>{};

    if (responseHeader) {
      logResponse['statusCode'] = response.statusCode;
      if (response.isRedirect == true) {
        logResponse['redirect'] = response.realUri;
      }
      var headersResponse = <String, Object?>{};
      response.headers
          .forEach((key, v) => headersResponse[key] = v.join('\r\n\t'));
      logResponse['headers'] = headersResponse;
    }
    if (responseBody) {
      logResponse['response'] = response.data;
    }
    const encoder = JsonEncoder.withIndent('  ');
    logPrint(encoder.convert(logResponse), printType: printType);
  }

  void _printKV(String key, Object? v, PrintType printType) {
    logPrint('$key: $v', printType: printType);
  }
}
