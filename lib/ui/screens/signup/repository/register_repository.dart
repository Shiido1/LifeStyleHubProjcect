import 'dart:async';

import '../../../../helper/configs/instances.dart';
import '../model/register_model.dart';
import '../../../../utils/paths.dart';

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
