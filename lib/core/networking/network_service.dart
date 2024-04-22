import 'package:dio/dio.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';
import 'package:s_mobills/core/networking/model/model.dart';

class NetworkService {
  NetworkService({required Dio dio, Iterable<Interceptor>? interceptors})
      : _dio = dio {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
  }

  final Dio _dio;

  Future<Result<R>> performRequest<R>({
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

      final responseData = response.data;

      if (responseData != null) {
        final result = converter(responseData);
        return Success(result);
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
}
