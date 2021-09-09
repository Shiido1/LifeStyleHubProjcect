import 'dart:async';

import '../../../../helper/configs/instances.dart';
import '../model/reset_password_model.dart';
import '../../../../utils/paths.dart';

class ResetPasswordRepository {
  Future<ResetPasswordModel> reset({required Map map}) async {
    try {
      final _response =
          await apiBaseHelper.post(url: Paths.forgotPassword, map: map);
      return ResetPasswordModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
