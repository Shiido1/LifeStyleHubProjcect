import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/commission_model.dart';
import '../../../../../../utils/paths.dart';

class CommissionRepository {
  /// commission
  Future<CommissionModel> getCommissions({String? search, int? page}) async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.getCommission,
          queryParameters: {'page': page, 'search': search, 'per_page': 20},
          options: await getDioHeader());
      return CommissionModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
