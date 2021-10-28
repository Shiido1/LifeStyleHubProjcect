import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import '../model/my_downline_response.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/my_generation_downline_response.dart'
    as generation;
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/my_lead_wise_response.dart'
    as lead;
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/my_vpp_response.dart'
    as vpp;
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/view_account_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/view_account_network_response.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../repository/network_repository.dart';

NetworkRepository _networkRepository = NetworkRepository();

class NetworkViewModel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  List<ViewAccountResponse>? _viewAccountResponseList = [];

  List<ViewAccountResponse>? get viewAccountResponseList =>
      _viewAccountResponseList;

  ViewAccountNetworkResponse? _accountNetworkResponse =
      ViewAccountNetworkResponse();

  ViewAccountNetworkResponse? get accountNetworkResponse =>
      _accountNetworkResponse;

  /// initialize auth viewmodel
  void init(BuildContext context) {
    this._context = context;
  }

  /// show loading indicator
  void _showLoading() {
    _loading = true;
    notifyListeners();
  }

  /// hide loading indicator
  void _hideLoading() {
    _loading = false;
    notifyListeners();
  }

  /// get list of network
  Future<void> getNetworkAccount() async {
    try {
      if (_viewAccountResponseList!.length == 0) _showLoading();
      final _response = await _networkRepository.getNetworkAccount();
      _viewAccountResponseList = _response.viewAccountResponseList;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get network details
  Future<void> getNetworkAccountDetails(int id) async {
    try {
      _showLoading();
      final _response = await _networkRepository.getNetworkAccountDetail(id);
      _accountNetworkResponse = _response;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  List<Data>? downlineResponse = [];

  /// get users direct downline
  Future<void> getUsersDownline(int id) async {
    try {
      if (downlineResponse!.length == 0) _showLoading();
      final _response = await _networkRepository.getUsersDownline(id);
      downlineResponse = _response.data;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  List<generation.Data> generationData = [];
  generation.MyGenerationDownlineResponse? myGenerationDownlineResponse;

  /// get users generation downline
  Future<void> getUsersGenerationDownline(int id) async {
    try {
      if (generationData.length == 0) _showLoading();
      final _response = await _networkRepository.getUsersGenerationDownline(id);
      myGenerationDownlineResponse = _response;
      generationData = _response.generationDownline!.data!;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  List<lead.Data> leadsWise = [];

  /// get users lead wise downline
  Future<void> getUsersLeadWise(int id) async {
    try {
      if (leadsWise.length == 0) _showLoading();
      final _response = await _networkRepository.getUsersLeadWise(id);
      leadsWise = _response.data!;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  List<vpp.Data> vppData = [];

  /// get users [VPP] downline
  Future<void> getUsersVPP() async {
    try {
      if (vppData.length == 0) _showLoading();
      final _response = await _networkRepository.getUsersVPP();
      vppData = _response.data!;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// update VPP
  Future<void> registerVpp(FormData body) async {
    try {
      _showLoading();
      final _response = await _networkRepository.registerVpp(body);
      showsnackBarInfo(this._context,
          message: _response.message ?? '', bgColor: Pallets.green500);
      getUsersVPP();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// update VPP
  Future<void> updateVPP(int id, FormData body) async {
    try {
      _showLoading();
      final _response = await _networkRepository.updateVPP(id, body);
      showsnackBarInfo(this._context,
          message: _response.message ?? '', bgColor: Pallets.green500);
      getUsersVPP();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// update VPP
  Future<void> deactivateVPP(int id) async {
    try {
      final _response = await _networkRepository.deactivateVPP(id);
      showsnackBarInfo(this._context,
          message: _response.message ?? '', bgColor: Pallets.green500);
      getUsersVPP();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
