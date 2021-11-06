// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:lifestyle_hub/core/data/session_manager.dart';
import 'api_error.dart';
import 'app_config.dart';
import 'app_interceptor.dart';

/// description: A network provider class which manages network connections
/// between the app and external services. This is a wrapper around [Dio].
///
/// Using this class automatically handle, token management, logging, global

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

/// A top level function to print dio logs
void printDioLogs(Object object) {
  printWrapped(object.toString());
}

class NetworkService {
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  Dio? dio;
  String? baseUrl, authToken;

  NetworkService({String? baseUrl, String? authToken}) {
    // ignore: prefer_initializing_formals
    this.baseUrl = baseUrl;
    // ignore: prefer_initializing_formals
    this.authToken = authToken;
    _initialiseDio();
  }

  /// Initialize essential class properties
  void _initialiseDio() {
    dio = Dio(BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      baseUrl: baseUrl ?? AppConfig.coreBaseUrl,
    ));
    authToken ??= SessionManager.instance.authToken;
    dio!.interceptors
      ..add(AppInterceptor(authToken!))
      ..add(LogInterceptor(requestBody: true, logPrint: printDioLogs));
  }

  /// Factory constructor used mainly for injecting an instance of [Dio] mock
  NetworkService.test(this.dio);

  post(
      {String? url,
      Map<String, dynamic>? queryParameters,
      map,
      Options? options}) async {
    try {
      final _response = await dio!.post(url!,
          data: map,
          queryParameters: queryParameters,
          options: options ?? await _getOption());
      return _response.data;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // eventBus.fire(LogoutEvent("just log out out of here pls"));
      }
      return Future.error(apiError, stackTrace);
    }
  }

  put({String? url, map, Options? options}) async {
    try {
      final _response = await dio!
          .put(url!, data: map, options: options ?? await _getOption());
      return _response.data;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // eventBus.fire(LogoutEvent("just log out out of here pls"));
      }
      return Future.error(apiError, stackTrace);
    }
  }

  get(
      {String? url,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      final _response = await dio!.get(url!,
          queryParameters: queryParameters,
          options: options ?? await _getOption());
      return _response.data;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // eventBus.fire(LogoutEvent("just log out out of here pls"));
      }
      return Future.error(apiError, stackTrace);
    }
  }

  delete({String? url, map, Options? options}) async {
    try {
      final _response = await dio!.delete(url!,
          queryParameters: map, options: options ?? await _getOption());
      return _response.data;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // eventBus.fire(LogoutEvent("just log out out of here pls"));
      }
      return Future.error(apiError, stackTrace);
    }
  }

  upload(
      {String? url,
      formData,
      Map<String, dynamic>? params,
      Options? options}) async {
    try {
      final _response = await dio!.post(url!,
          data: formData,
          queryParameters: params,
          options: options ??
              Options(headers: {
                "Authorization": "Bearer " + SessionManager.instance.authToken,
                "Content-Disposition": "form-data",
                "Content-Type": "multipart/form-data",
                'Accept': 'application/json'
              }), onSendProgress: (sent, total) {
        // eventBus
        //     .fire(
        //     FileUploadProgressEvent(FileUploadProgress(sent, total, tag: classTag)));
      });
      return _response.data;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // eventBus.fire(LogoutEvent("just log out out of here pls"));
      }
      return Future.error(apiError, stackTrace);
    }
  }

  Future<Options> _getOption() async {
    return Options(headers: {
      "Authorization": "Bearer " + SessionManager.instance.authToken,
      'Accept': 'application/json'
    });
  }
}
