import 'dart:async';

import '../../../../helper/configs/constants.dart';
import '../../../../helper/configs/instances.dart';
import '../model/login_model.dart';
import '../../../../utils/paths.dart';

class LoginRepository {
  Future<LoginModel> login({required Map map}) async {
    try {
      final _response = await apiBaseHelper.post(url: Paths.login, map: map);
      final _login = LoginModel.fromJson(_response);

      /// cache login data
      await prefManager.saveValue(
          key: AppConstants.usersPrefKey, value: _login.toJson());
      return _login;
    } catch (e) {
      throw e;
    }
  }
}
