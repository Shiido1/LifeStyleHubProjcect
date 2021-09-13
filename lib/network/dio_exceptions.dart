import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/dashboard.dart';

class NetworkExceptions implements Exception {
  NetworkExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout";
        break;
      case DioErrorType.other:
        message = "Connection failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  NetworkExceptions.fromExceptionError(error) {
    switch (error) {
      case SocketException:
        message = 'connection failure';
        break;
      case TimeoutException:
        message = 'network timeout';
        break;
      default:
        message = "An unknown error occurred";
        break;
    }
  }

  String message = '';

  String _handleError(int statusCode, dynamic error) {
    final String errorMessage =
        NotFoundException(message: error["message"]).message!;
    switch (statusCode) {
      case 200:
      case 201:
      case 302:
      case 400:
        return 'Bad request';
      case 401:
        eventBus
            .fire(UserLoggedInEvent(logUserOut: true, message: errorMessage));
        return errorMessage;
      case 403:
      case 404:
        return errorMessage;
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}

class NotFoundException {
  final String? message;

  NotFoundException({this.message});
}
