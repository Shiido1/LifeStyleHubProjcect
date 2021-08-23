import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
void showsnackBarInfo(BuildContext? context,
    {required message, Color? bgColor}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: bgColor != null ? bgColor : Pallets.orange500,
  ));
}

/// get header
Future<Map<String, String>> getHeader() async {
  Map<String, String> _header = Map<String, String>();

  var _data = await prefManager.getCachedData(key: AppConstants.usersPrefKey);
  LoginModel _user = LoginModel.fromJson(_data);
  String? _bearer = _user != null ? _user.token : AppConstants.tempToken;
  _header[HttpHeaders.authorizationHeader] = 'Bearer $_bearer';
  return _header;
}

/// [Format] content strings
String format(String values) {
  return values
      .replaceAll('\\', '')
      .replaceAll('path', '')
      .replaceAll('{"":', '')
      .replaceAll('}', '');
}

/// format date
String fomartDate(String date) {
  DateTime _dt = DateTime.parse(date);
  return DateFormat("dd MMM, yyyy").format(_dt);
}

String fomartTime(String date) {
  DateTime _dt = DateTime.parse(date);
  return DateFormat("HH:MM a").format(_dt);
}

/// get expiry date
Future<Duration> getTrialDuration() async {
  final _usersData =
      await prefManager.getCachedData(key: AppConstants.usersPrefKey);
  LoginModel _user = LoginModel.fromJson(_usersData);
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateTime duration = dateFormat.parse(_user.user!.trialEnds!);
  DateTime presentDate = dateFormat.parse(DateTime.now().toIso8601String());
  final _answer = duration.difference(presentDate);
  return Duration(
      days: _answer.inDays,
      hours: DateTime.now().hour,
      minutes: DateTime.now().minute);
}
