import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/utils/paths.dart';

import 'exception.dart';
import 'http_responses.dart';

class ApiBaseHelper {
  /// [@POST REQUEST]
  Future<dynamic> post(
      {required String? url, Map? map, Map<String, String>? header}) async {
    var _responseJson;
    try {
      final response = await http
          .post(Uri.parse('${Paths.baseUrl}$url'), body: map, headers: header)
          .timeout(Duration(seconds: AppConstants.timeOutDuration));

      _responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on FormatException {
      throw FetchDataException('Bad response format');
    }
    return _responseJson;
  }

  /// [@GET REQUEST]
  Future<dynamic> get(
      {required String? url, Map<String, String>? header}) async {
    var _responseJson;
    try {
      final response = await http
          .get(Uri.parse('${Paths.baseUrl}$url'), headers: header)
          .timeout(Duration(seconds: AppConstants.timeOutDuration));

      _responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on FormatException {
      throw FetchDataException('Bad response format');
    }
    return _responseJson;
  }

  /// [@PUT REQUEST]
  Future<dynamic> put(
      {required String? url,
      required dynamic map,
      Map<String, String>? header}) async {
    var _responseJson;
    try {
      final response = await http
          .put(Uri.parse('${Paths.baseUrl}$url'), body: map, headers: header)
          .timeout(Duration(seconds: AppConstants.timeOutDuration));

      _responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on FormatException {
      throw FetchDataException('Bad response format');
    }
    return _responseJson;
  }

  /// [@DELETE REQUEST]
  Future<dynamic> delete(
      {required String? url, Map<String, String>? header}) async {
    var _responseJson;
    try {
      final response = await http
          .delete(Uri.parse('${Paths.baseUrl}$url'), headers: header)
          .timeout(Duration(seconds: AppConstants.timeOutDuration));

      _responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on FormatException {
      throw FetchDataException('Bad response format');
    }
    return _responseJson;
  }
}
