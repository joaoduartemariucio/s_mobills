import 'package:dio/dio.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';
import 'package:s_mobills/core/networking/model/model.dart';

class NetworkService {
  NetworkService({required Dio dio, Iterable<Interceptor>? interceptors})
      : _dio = dio {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
  }

  final Dio _dio;

  Future<Result<R>> requestJSON<R>({
    required URLRequest request,
    required R Function(Map<String, dynamic>) converter,
    JSON? data,
    QueryParams? queryParams,
  }) async {
    try {
      final response = await _dio.request<JSON>(
        request.path,
        data: data,
        queryParameters: queryParams,
        options: Options(
          method: request.method,
          extra: <String, Object?>{
            'requiresAuthToken': request.requiresAuthentication,
          },
        ),
      );

      final result = response.data;

      if (result != null) {
        final decoded = converter(result);
        return Success(decoded);
      }

      return Failure(
        SMobillsException.response().copyWith(
          statusCode: response.statusCode,
        ),
      );
    } on DioError catch (e) {
      final exception = SMobillsException.fromDioException(e);
      return Failure(exception);
    }
  }

  Future<Result<List<R>>> requestList<R>({
    required URLRequest request,
    required List<R> Function(List<dynamic>) converter,
    JSON? data,
    QueryParams? queryParams,
  }) async {
    try {
      final response = await _dio.request<List<dynamic>>(
        request.path,
        data: data,
        queryParameters: queryParams,
        options: Options(
          method: request.method,
          extra: <String, Object?>{
            'requiresAuthToken': request.requiresAuthentication,
          },
        ),
      );

      final result = response.data;

      if (result != null) {
        final decoded = converter(result);
        return Success(decoded);
      }

      return Failure(
        SMobillsException.response().copyWith(
          statusCode: response.statusCode,
        ),
      );
    } on DioError catch (e) {
      final exception = SMobillsException.fromDioException(e);
      return Failure(exception);
    }
  }

  Future<Result<void>> requestVoid({
    required URLRequest request,
    JSON? data,
    QueryParams? queryParams,
  }) async {
    try {
      await _dio.request<void>(
        request.path,
        data: data,
        queryParameters: queryParams,
        options: Options(
          method: request.method,
          extra: <String, Object?>{
            'requiresAuthToken': request.requiresAuthentication,
          },
        ),
      );

      return Success(());
    } on DioError catch (e) {
      final exception = SMobillsException.fromDioException(e);
      return Failure(exception);
    }
  }
}
