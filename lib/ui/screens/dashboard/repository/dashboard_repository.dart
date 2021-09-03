import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/model/commission_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/delete_marketting_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/update_resource_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/model/dashboard_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

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
