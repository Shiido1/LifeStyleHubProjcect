import 'dart:async';

import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/login/model/login_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class LoginRepository {
  Future<LoginModel> login({required Map map}) async {
    try {
      final _response = await apiBaseHelper.post(url: Paths.login, map: map);
      return LoginModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
