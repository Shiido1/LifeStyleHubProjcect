import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class MarkettingRepository {
  Future<GetResourcesModelList> getMarketting() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.getMarketting, header: await getHeader());
      return GetResourcesModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
