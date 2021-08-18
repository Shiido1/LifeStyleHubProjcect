import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/login/model/login_model.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'configs/constants.dart';

/// get device width
double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// get device height
double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// show snackbar
void showsnackBarInfo(BuildContext? context, {required message}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Pallets.orange500,
  ));
}

/// get header
Future<Map<String, String>> getHeader() async {
  Map<String, String> _header = Map<String, String>();

  var _data = await prefManager.getCachedData(key: AppConstants.usersPrefKey);
  LoginModel _user = LoginModel.fromJson(_data);
  // ignore: unnecessary_null_comparison
  String? _bearer = _user != null ? _user.token : AppConstants.tempToken;
  _header[HttpHeaders.authorizationHeader] = 'Bearer $_bearer';
  return _header;
}
