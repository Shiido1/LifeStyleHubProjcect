import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exception.dart';

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      var responseJson = json.decode(response.body.toString());
      throw BadRequestException(responseJson['message']);
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occurred while Communicating with Server with StatusCode : ${response.statusCode}');
  }
}