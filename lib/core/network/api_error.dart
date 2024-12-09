import 'dart:io';

import 'package:dio/dio.dart';

class ApiError implements Exception {
  final String errorDescription;
  final dynamic data;
  final DioExceptionType? dioErrorType;
  final int? statusCode;
  static const unknownError = 'Something went wrong, please try again or contact support';
  static const internetError = 'Internet connection error, please try again';
  static const cancelError = 'API request canceled, please try again';
  static const notFoundStatusCode = 404;

  static const internetError2 = 'Please check your internet connection, seems you are offline';

  final dynamic errors;

  ApiError({required this.errorDescription, this.statusCode, this.data, this.errors, this.dioErrorType});

  factory ApiError.fromDioException(DioException error) {
    try {
      String description = '';
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          description = internetError;
        case DioExceptionType.badCertificate:
          description = unknownError;
        case DioExceptionType.badResponse:
          description = extractDescriptionFromResponse(error.response);
        case DioExceptionType.cancel:
          description = cancelError;
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            description = internetError;
          } else {
            description = unknownError;
          }
      }
      return ApiError(
        errorDescription: description,
        dioErrorType: error.type,
        data: error.response?.data != null ? error.response?.data['data'] : null,
        statusCode: error.response?.statusCode,
      );
    } catch (_) {
      throw ApiError(errorDescription: unknownError, statusCode: 400);
    }
  }

  static String extractDescriptionFromResponse(Response? response) {
    try {
      if (response!.data != null && response.data['ResponseDescription'] != null) {
        return response.data['ResponseDescription'] as String;
      } else if (response.data != null && response.data['message'] != null) {
        return response.data['message'] as String;
      } else if (response.statusCode! >= 500) {
        return 'Internal Server error, please try again later';
      } else {
        return response.statusMessage ?? '';
      }
    } catch (error) {
      throw ApiError(errorDescription: unknownError, statusCode: 400);
    }
  }

  @override
  String toString() => errorDescription;
}
