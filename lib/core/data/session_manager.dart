import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

/// A class for managing sessions, handles saving and retrieving of data
class SessionManager {
  SessionManager._internal();

  SharedPreferences? sharedPreferences;

  static SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  static SessionManager get instance => _instance;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String KEY_AUTH_TOKEN = 'authToken';

  String get authToken => sharedPreferences!.getString(KEY_AUTH_TOKEN) ?? '';

  set authToken(String authToken) =>
      sharedPreferences!.setString(KEY_AUTH_TOKEN, authToken);
  //

  Future<bool> logOut() async {
    await sharedPreferences!.clear();
    try {
      final cacheDir = await getTemporaryDirectory();
      if (cacheDir.existsSync()) {
        cacheDir.deleteSync(recursive: true);
      }
      final appDir = await getApplicationSupportDirectory();
      if (appDir.existsSync()) {
        appDir.deleteSync(recursive: true);
      }
    } catch (e) {
      print("error clearing cache");
    }
    return true;
  }
}
