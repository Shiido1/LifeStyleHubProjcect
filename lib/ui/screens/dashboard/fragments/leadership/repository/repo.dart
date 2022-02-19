import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/leadership/model/leadership_response_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class LeadershipRepository {
 
  /// leadership
  Future<LeaderShipResponseModel> leadership() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.leadership, options: await getDioHeader());
      return LeaderShipResponseModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
