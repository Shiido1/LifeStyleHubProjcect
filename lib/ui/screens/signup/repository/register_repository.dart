import 'dart:async';

import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/signup/model/register_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class RegisterRepository {
  Future<RegisterModel> register({required Map map}) async {
    try {
      final _response = await apiBaseHelper.post(url: Paths.register, map: map);
      return RegisterModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
