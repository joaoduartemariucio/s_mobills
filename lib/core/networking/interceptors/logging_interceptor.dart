// ignore_for_file: avoid_dynamic_calls, strict_raw_type

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final httpMethod = options.method.toUpperCase();
    final url = options.baseUrl + options.path;

    debugPrint('--> $httpMethod $url');

    debugPrint('\tHeaders:');
    options.headers.forEach((k, Object? v) => debugPrint('\t\t$k: $v'));

    if (options.queryParameters.isNotEmpty) {
      debugPrint('\tqueryParams:');
      options.queryParameters
          .forEach((k, Object? v) => debugPrint('\t\t$k: $v'));
    }

    if (options.data != null) {
      debugPrint('\tBody: ${options.data}');
    }

    debugPrint('--> END $httpMethod');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint('<-- RESPONSE');

    debugPrint('\tStatus code: ${response.statusCode}');

    if (response.statusCode == 304) {
      debugPrint('\tSource: Cache');
    } else {
      debugPrint('\tSource: Network');
    }

    debugPrint('\tResponse: ${response.data}');

    debugPrint('<-- END HTTP');

    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    debugPrint('--> ERROR');
    final httpMethod = err.requestOptions.method.toUpperCase();
    final url = err.requestOptions.baseUrl + err.requestOptions.path;

    debugPrint('\tMETHOD: $httpMethod');
    debugPrint('\tURL: $url');
    if (err.response != null) {
      debugPrint('\tStatus code: ${err.response!.statusCode}');
      final data = err.response?.data;
      final message = data['message'] as String;
      final code = err.response?.statusMessage;
      debugPrint('\tException: $code');
      debugPrint('\tMessage: $message');
      debugPrint('\tData: $data');
    } else if (err.error is SocketException) {
      const message = 'No internet connectivity';
      debugPrint('\tException: FetchDataException');
      debugPrint('\tMessage: $message');
    } else {
      debugPrint('\tUnknown Error');
    }

    debugPrint('<-- END ERROR');

    return super.onError(err, handler);
  }
}
