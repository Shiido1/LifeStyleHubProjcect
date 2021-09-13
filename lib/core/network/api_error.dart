import 'package:dio/dio.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';

/// Helper class for converting [DioError] into readable formats
class ApiError {
  int? errorType = 0;
  ApiErrorModel? apiErrorModel;

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription =
              "Connection timeout with API server, please try again later";
          break;
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to internet connection, please check and try again";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription =
              "Receive timeout in connection with API server, please try again later.";
          break;
        case DioErrorType.response:
          this.errorType = dioError.response?.statusCode;
          if (dioError.response?.statusCode == 401) {
            // this.errorDescription =
            //     "Your session has timed out, please login again to proceed";
            this.apiErrorModel =
                ApiErrorModel.fromJson(dioError.response?.data);
            this.errorDescription =
                extractDescriptionFromResponse(error.response);
          } else {
            this.errorDescription =
                "Oops! we could'nt make connections, please try again";
          }
          break;
        case DioErrorType.sendTimeout:
          errorDescription =
              "Connection to API server failed due to internet connection, please check and try again";
          break;
      }
    } else {
      errorDescription = "Oops an error occured, we are fixing it";
    }
  }

  String extractDescriptionFromResponse(Response<dynamic>? response) {
    String message = "";
    try {
      if (response?.data != null && response?.data["message"] != null) {
        message = response?.data["message"];
      } else {
        message = response?.statusMessage ?? '';
      }
    } catch (error, stackTrace) {
      message = response?.statusMessage ?? error.toString();
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}

class ApiErrorModel {
  int? code;
  String? message;
  bool? success;

  ApiErrorModel({
    this.code,
    this.message,
    this.success,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        code: json["code"],
        message: json["message"],
        success: json["success"],
      );
}
