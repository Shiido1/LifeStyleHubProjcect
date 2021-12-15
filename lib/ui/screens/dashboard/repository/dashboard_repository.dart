import '../../../../helper/configs/instances.dart';
import '../../../../helper/helper_handler.dart';
import '../model/dashboard_model.dart';
import '../../../../utils/paths.dart';

class DashboardRepository {
  /// commission
  Future<DashboardModel> dashboard(bool isUser) async {
    try {
      final _response = await apiBaseHelper.get(
          url: isUser ? Paths.dashboardVp : Paths.dashboardVPP,
          options: await getDioHeader());
      return DashboardModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
