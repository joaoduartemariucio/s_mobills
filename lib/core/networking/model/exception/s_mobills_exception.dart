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
              message: 'Request cancelled prematurely',
            );
          case DioErrorType.connectTimeout:
            return SMobillsException(
              exceptionType: ExceptionType.ConnectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection not established',
            );
          case DioErrorType.sendTimeout:
            return SMobillsException(
              exceptionType: ExceptionType.SendTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to send',
            );
          case DioErrorType.receiveTimeout:
            return SMobillsException(
              exceptionType: ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to receive',
            );
          case DioErrorType.other || DioErrorType.response:
            return SMobillsException(
              message: 'Error unrecognized',
              code: ExceptionType.UnrecognizedException.name,
              statusCode: error.response?.statusCode,
            );
        }
      } else {
        return SMobillsException(
          exceptionType: ExceptionType.UnrecognizedException,
          message: 'Error unrecognized',
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
        message: 'Error unrecognized',
      );
    }
  }

  factory SMobillsException.response() {
    return SMobillsException(
      exceptionType: ExceptionType.ResponseDataNullException,
      message: 'Response data null',
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
