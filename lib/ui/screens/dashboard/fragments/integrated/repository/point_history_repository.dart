import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/point_history_model.dart';
import '../../../../../../utils/paths.dart';

class PointHistoryRepository {
  /// get point history
  Future<PointHistoryModel> pointHistory() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.point,
          queryParameters: {'search': ''},
          options: await getDioHeader());
      return PointHistoryModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
