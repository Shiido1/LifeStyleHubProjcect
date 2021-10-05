import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/my_downline_response.dart';
import 'package:lifestyle_hub/utils/paths.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import 'model/my_generation_downline_response.dart';
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
          url: '${Paths.accountDetails}user/$id/network',
          options: await getDioHeader());
      return ViewAccountNetworkResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] return users downline
  Future<MyDownlineResponse> getUsersDownline(int id) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.accountDetails}user/$id/direct-downline',
          options: await getDioHeader());
      return MyDownlineResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] return users generation dowline
  Future<MyGenerationDownlineResponse> getUsersGenerationDownline(
      int id) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.accountDetails}user/$id/generation-downline',
          options: await getDioHeader());
      return MyGenerationDownlineResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
