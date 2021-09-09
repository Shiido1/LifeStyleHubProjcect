import '../../../../helper/configs/constants.dart';
import '../../../../helper/configs/instances.dart';
import '../../../../helper/helper_handler.dart';
import '../fragments/commission/model/commission_model.dart';
import '../fragments/marketting/model/delete_marketting_model.dart';
import '../fragments/marketting/model/get_resources_model.dart';
import '../fragments/marketting/model/update_resource_model.dart';
import '../model/dashboard_model.dart';
import '../../../../utils/paths.dart';

class DashboardRepository {
  /// commission
  Future<DashboardModel> dashboard() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.dashboard, options: await getDioHeader());
      return DashboardModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
