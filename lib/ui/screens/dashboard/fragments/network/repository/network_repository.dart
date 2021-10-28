import 'package:dio/dio.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/vpp_response.dart';

import '../model/my_downline_response.dart';
import '../model/my_lead_wise_response.dart';
import '../model/my_vpp_response.dart';
import '../../../../../../utils/paths.dart';

import '../../../../../../../helper/configs/instances.dart';
import '../../../../../../../helper/helper_handler.dart';
import '../model/my_generation_downline_response.dart';
import '../model/view_account_model.dart';
import '../model/view_account_network_response.dart';

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

  /// [@Get] return users lead wise dowline
  Future<MyLeadWiseResponse> getUsersLeadWise(int id) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.accountDetails}user/$id/leadwise-downline',
          options: await getDioHeader());
      return MyLeadWiseResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] return users l
  Future<MyVppResponse> getUsersVPP() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.usersVPP, options: await getDioHeader());
      return MyVppResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// Register VPP
  Future<VppResponse> registerVpp(FormData body) async {
    try {
      final _response = await apiBaseHelper.post(
          url: Paths.usersVPP, options: await getDioHeader(), map: body);
      return VppResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// Update VPP
  Future<VppResponse> updateVPP(int id, FormData body) async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.usersVPP}/$id',
          options: await getDioHeader(),
          map: body);
      return VppResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// Deactivate VPP
  Future<VppResponse> deactivateVPP(int id) async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.usersVPP}/$id/deactivate',
          options: await getDioHeader());
      logger.d(_response);
      return VppResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
