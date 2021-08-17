import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class MarkettingRepository {
  Future<dynamic> getMarketting() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.getMarketting, header: getHeader());
      // final _login = LoginModel.fromJson(_response);
      return null;
    } catch (e) {
      throw e;
    }
  }
}
