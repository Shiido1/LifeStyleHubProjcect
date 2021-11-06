import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../helper/configs/instances.dart';

import 'dio_exceptions.dart';

const _defaultConnectTimeout = 30000;
const _defaultReceiveTimeout = 30000;

/// A top level function to print dio logs
void printDioLogs(Object object) {
  printWrapped(object.toString());
}

void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

class DioClient {
  final String baseUrl;

  Dio? _dio = Dio();

  final List<Interceptor>? interceptors;

  DioClient(
    this.baseUrl, {
    this.interceptors,
  }) {
    _dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.method
      ..options.headers = {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
      ..options.headers = {  'Accepts' : 'application/json'};

    if (interceptors?.isNotEmpty ?? false) {
      _dio!.interceptors.addAll(interceptors!);
    }
    if (kDebugMode) {
      _dio!.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    }
  }

  Future<dynamic> get({
    String? url,
    map,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.get(
        url!,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e) {
      throw NetworkExceptions.fromDioError(e);
    } on Exception catch (e) {
      throw NetworkExceptions.fromExceptionError(e);
    }
  }

  Future<dynamic> post({
    String? url,
    map,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.post(
        url!,
        data: map,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e) {
      throw NetworkExceptions.fromDioError(e);
    } on Exception catch (e) {
      throw NetworkExceptions.fromExceptionError(e);
    }
  }

  Future<dynamic> put({
    String? url,
    map,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.put(
        url!,
        data: map,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e) {
      throw NetworkExceptions.fromDioError(e);
    } on Exception catch (e) {
      throw NetworkExceptions.fromExceptionError(e);
    }
  }

  Future<dynamic> delete({
    String? url,
    map,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.delete(url!,
          data: map,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw NetworkExceptions.fromDioError(e);
    } on Exception catch (e) {
      throw NetworkExceptions.fromExceptionError(e);
    }
  }

  Future<dynamic> patch(
    String uri,
    dynamic map, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.patch(
        uri,
        data: map,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e) {
      throw NetworkExceptions.fromDioError(e);
    } on Exception catch (e) {
      throw NetworkExceptions.fromExceptionError(e);
    }
  }
}
