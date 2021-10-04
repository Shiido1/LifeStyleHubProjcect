import 'package:lifestyle_hub/utils/paths.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import 'model/view_account_model.dart';
import 'model/view_account_network_response.dart';

class NetworkRepository {
  /// [@Get] network account list
  Future<ViewAccountResponseList> getNetworkAccount() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.accounts, options: await getDioHeader());
      return ViewAccountResponseList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] network account details
  Future<ViewAccountNetworkResponse> getNetworkAccountDetail(int id) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.accountDetails}user/$id/network', options: await getDioHeader());
      return ViewAccountNetworkResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
