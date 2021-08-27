import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/model/point_history_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class PointHistoryRepository {
  /// get point history
  Future<PointHistoryModel> pointHistory() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.point, options: await getDioHeader());
      return PointHistoryModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
