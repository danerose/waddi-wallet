import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:waddi_wallet_app/core/enum/exceptions.enum.dart';
import 'package:waddi_wallet_app/core/exceptions/custom.exceptions.dart';

class DioService {
  late String baseUrl;
  late Dio _dio;
  late List<Interceptor>? interceptors;

  DioService({
    required this.baseUrl,
    required Dio dio,
    Locale? lang,
    this.interceptors,
  }) {
    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.headers = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept-Language': lang ?? 'es-MX'
      };
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors as Iterable<Interceptor>);
    }
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          error: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (e) {
      throw CustomException.dioException(res: e.response?.data);
    } on SocketException catch (e) {
      throw CustomException.exception(e: e, error: ExceptionEnum.socket);
    } catch (e) {
      throw CustomException.exception(e: e, error: ExceptionEnum.unknown);
    }
  }

  Future<Response> post(
    String uri, {
    Map<String, dynamic>? body,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: body,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw CustomException.exception(e: e, error: ExceptionEnum.socket);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw CustomException.exception(e: e, error: ExceptionEnum.socket);
      } else {
        throw CustomException.dioException(res: e.response);
      }
    } catch (e) {
      throw CustomException.exception(e: e, error: ExceptionEnum.unknown);
    }
  }

  Future<Response> patch(
    String uri, {
    Map<String, dynamic>? body,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        uri,
        data: body,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw CustomException.exception(e: e, error: ExceptionEnum.socket);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw CustomException.exception(e: e, error: ExceptionEnum.socket);
      } else {
        throw CustomException.dioException(res: e.response);
      }
    } catch (e) {
      throw CustomException.exception(e: e, error: ExceptionEnum.unknown);
    }
  }
}
