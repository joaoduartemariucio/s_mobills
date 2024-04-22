// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';
import 'package:s_mobills/core/local/key_value_storage_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.storage}) : super();

  final KeyValueStorageService storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        final token = await storage.getAuthToken();
        options.headers.addAll(
          <String, Object?>{'Authorization': 'Bearer $token'},
        );
      }

      options.extra.remove('requiresAuthToken');
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final success = response.data != null;

    if (success) return handler.next(response);

    //Reject all error codes from server except 402 and 200 OK
    return handler.reject(
      DioError(
        requestOptions: response.requestOptions,
        response: response,
      ),
    );
  }
}
