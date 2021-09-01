import 'dart:async';

import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/reset_password/model/reset_password_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

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
