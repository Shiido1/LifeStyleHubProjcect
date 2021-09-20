import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../ui/screens/login/model/login_model.dart';
import '../utils/pallets.dart';
import 'configs/constants.dart';
import 'configs/instances.dart';

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

/// @ get headers
Future<Options> getDioHeader({String? token}) async {
  Map<String, String> _header = Map<String, String>();
  var _data = await prefManager.getCachedData(key: AppConstants.usersPrefKey);
  LoginModel _user = LoginModel.fromJson(_data);
  String? _bearer = _user.token != null ? _user.token : AppConstants.tempToken;
  _header[HttpHeaders.authorizationHeader] = 'Bearer $_bearer';
  _header[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
  _header[HttpHeaders.acceptHeader] = 'application/json';
  _header[HttpHeaders.contentEncodingHeader] = 'gzip, deflate, br';
  return Options(headers: _header);
}

/// [Format] content strings
String format(String values) {
  return values
      .replaceAll('\\', '')
      .replaceAll('path', '')
      .replaceAll('{"":', '')
      .replaceAll('}', '')
      .replaceAll('""', '');
}

/// format date
String fomartDate(String date) {
  DateTime _dt = DateTime.parse(date);
  return DateFormat("dd MMM, yyyy").format(_dt);
}

/// format time
String fomartTime(String date) {
  DateTime _dt = DateTime.parse(date);
  return DateFormat("HH:MM a").format(_dt);
}

/// formart complete date
String fomartCompleteDate(String date) {
  DateTime _dt = DateTime.parse(date);
  // return DateFormat('EEE, MMM d, ''yy').format(_dt);
  return DateFormat('EEE d MMMM, yyyy').format(_dt);
}

/// get expiry date
Future<CountDownTimer> getTrialDuration() async {
  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final _usersData =
      await prefManager.getCachedData(key: AppConstants.usersPrefKey);
  LoginModel _user = LoginModel.fromJson(_usersData);
  DateTime duration = _dateFormat.parse(_user.user!.trialEnds!);

  final _answer = DateTime.now().difference(duration);

  return CountDownTimer(
      day: _answer.inDays,
      hour: DateTime.now().hour,
      miniute: DateTime.now().minute);
}

/// get dates
CountDownTimer getDateTime(String date) {
  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  DateTime _duration = _dateFormat.parse(date);
  DateTime presentDate = _dateFormat.parse(DateTime.now().toIso8601String());
  final _answer = _duration.difference(presentDate);
  return CountDownTimer(
      day: _answer.inDays,
      hour: DateTime.now().hour,
      miniute: DateTime.now().minute);
}

/// format currency
String formatCurrency(dynamic i) {
  return NumberFormat.simpleCurrency().format(i);
}

//* getting local path
Future<Directory?> findLocalPath() async {
  final directory = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getApplicationDocumentsDirectory();
  return directory;
}

//* generate key
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String generateKey(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

//* generate id's
int generateId(int length) => _rnd.nextInt(length);

/// get file path
String getFileName(File file) {
  return basename(file.path);
}

/// percentage calculations
double getPercentage({num? directReferred, num? directRequired}) {
  double _answer = directReferred! / directRequired!;
  double _percentage = _answer * 100;
  return _percentage / 100;
}

void copyToClipBoard(BuildContext? context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  showsnackBarInfo(context, message: 'Copied to clip board');
}
