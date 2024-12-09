import 'package:chefwizz/core/local_service/hive_storage_service.dart';
import 'package:chefwizz/core/network/env_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'api_error.dart';
import 'app_interceptor.dart';

class Network {
  static const connectTimeOut = Duration(seconds: 120);
  static const receiveTimeOut = connectTimeOut;

  final LocalService _localService;

  Network({required LocalService localService})
      : _localService = localService;

  Dio _createDio(String baseUrlKey) {
    final dio = Dio(_defaultOpts(baseUrlKey))
      ..interceptors.addAll([
        if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
        AppInterceptor(),
      ]);
    return dio;
  }

  static BaseOptions _defaultOpts(String baseUrlKey) {
    return BaseOptions(
      baseUrl: EnvironmentConfig.getBaseUrl(),
      connectTimeout: connectTimeOut,
      receiveTimeout: receiveTimeOut,
    );
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authorization = true,
    String baseUrlKey = 'default',
  }) async {
    final dio = _createDio(baseUrlKey);
    try {
      final options = await _getOptions(authorization);
      return await dio.post(path, data: body, queryParameters: queryParameters, options: options);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool authorization = true,
    String baseUrlKey = 'default',
  }) async {
    final dio = _createDio(baseUrlKey);
    try {
      final options = await _getOptions(authorization);
      return await dio.get(path, queryParameters: queryParameters, options: options);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authorization = true,
    String baseUrlKey = 'default',
  }) async {
    final dio = _createDio(baseUrlKey);
    try {
      final options = await _getOptions(authorization);
      return await dio.put(path, data: body, queryParameters: queryParameters, options: options);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authorization = true,
    String baseUrlKey = 'default',
  }) async {
    final dio = _createDio(baseUrlKey);
    try {
      final options = await _getOptions(authorization);
      return await dio.patch(path, data: body, queryParameters: queryParameters, options: options);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> patchList(
    String path, {
    List<dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authorization = true,
    String baseUrlKey = 'default',
  }) async {
    final dio = _createDio(baseUrlKey);
    try {
      final options = await _getOptions(authorization);
      return await dio.patch(path, data: body, queryParameters: queryParameters, options: options);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authorization = true,
    String baseUrlKey = 'default',
  }) async {
    final dio = _createDio(baseUrlKey);
    try {
      final options = await _getOptions(authorization);
      return await dio.delete(path, data: body, queryParameters: queryParameters, options: options);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Options> _getOptions(bool authorization) async {
    if (authorization) {
      final token = await _localService.getAccessToken();
      return Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
    }
    return Options();
  }
}

final localServiceProvider = Provider<LocalService>((_) => LocalService());

final networkProvider = Provider<Network>((ref) {
  final localService = ref.read(localServiceProvider);
  return Network(localService: localService);
});
