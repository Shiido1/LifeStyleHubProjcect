import '../../../../../../helper/configs/constants.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/commission_model.dart';
import '../../marketting/model/delete_marketting_model.dart';
import '../../marketting/model/get_resources_model.dart';
import '../../marketting/model/update_resource_model.dart';
import '../../../../../../utils/paths.dart';

class CommissionRepository {
  /// commission
  Future<CommissionModel> getCommissions() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.getCommission, options: await getDioHeader());
      return CommissionModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
