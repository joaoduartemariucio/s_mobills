// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/core/networking/model/exception/exception_type.dart';

class SMobillsException implements Exception {
  SMobillsException({
    required this.message,
    this.code,
    int? statusCode,
    this.exceptionType = ExceptionType.ApiException,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory SMobillsException.fromDioException(Exception error) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            return SMobillsException(
              exceptionType: ExceptionType.CancelException,
              statusCode: error.response?.statusCode,
              message: 'Ops, algo deu errado',
            );
          case DioErrorType.connectTimeout:
            return SMobillsException(
              exceptionType: ExceptionType.ConnectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Parece que você está sem internet, cheque sua conexão.',
            );
          case DioErrorType.sendTimeout:
            return SMobillsException(
              exceptionType: ExceptionType.SendTimeoutException,
              statusCode: error.response?.statusCode,
              message:
                  'Tente novamente algo deu errado ao enviar as informações',
            );
          case DioErrorType.receiveTimeout:
            return SMobillsException(
              exceptionType: ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Falha na recepição das informações',
            );
          case DioErrorType.other || DioErrorType.response:
            return SMobillsException(
              message: 'Ops, algo deu errado',
              code: ExceptionType.UnrecognizedException.name,
              statusCode: error.response?.statusCode,
            );
        }
      } else {
        return SMobillsException(
          exceptionType: ExceptionType.UnrecognizedException,
          message: 'Ops, algo deu errado',
        );
      }
    } on FormatException catch (e) {
      return SMobillsException(
        exceptionType: ExceptionType.FormatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return SMobillsException(
        exceptionType: ExceptionType.UnrecognizedException,
        message: 'Ops, algo deu errado',
      );
    }
  }

  factory SMobillsException.response() {
    return SMobillsException(
      exceptionType: ExceptionType.ResponseDataNullException,
      message: 'Não foi possível identificar o resultado',
    );
  }

  SMobillsException copyWith({
    String? name,
    String? message,
    String? code,
    int? statusCode,
    ExceptionType? exceptionType,
  }) {
    return SMobillsException(
      message: message ?? this.message,
      code: code ?? this.code,
      statusCode: statusCode ?? this.statusCode,
      exceptionType: exceptionType ?? this.exceptionType,
    );
  }

  final String name;
  final String message;
  final String? code;
  final int? statusCode;
  final ExceptionType exceptionType;
}
