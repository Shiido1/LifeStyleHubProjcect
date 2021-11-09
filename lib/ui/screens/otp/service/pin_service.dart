import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../utils/paths.dart';

class PinRepository {
  /// [@View] Pin
  Future<String> generateOTP() async {
    try {
      final _response = await apiBaseHelper.post(
          url: Paths.generateOTP, options: await getDioHeader());
      return _response;
    } catch (e) {
      throw e;
    }
  }
}
