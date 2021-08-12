import 'dart:io';

import 'package:flutter/material.dart';
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
Map<String, String> getHeader({String? token}) {
  Map<String, String> _header = Map<String, String>();
  _header[HttpHeaders.authorizationHeader] =
      'Bearer ${token != null ? token : AppConstants.tempToken}';
  return _header;
}
