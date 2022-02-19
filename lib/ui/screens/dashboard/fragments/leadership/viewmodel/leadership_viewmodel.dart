import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/leadership/model/leadership_response_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/leadership/repository/repo.dart';

LeadershipRepository _leadershipRepository = LeadershipRepository();

class LeadershipViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;
  LeaderShipResponseModel? leadership;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  /// initialize auth viewmodel
  void init(BuildContext context) {
    this._context = context;
  }

  /// show loading indicator
  void showLoading({bool notify = false}) {
    _loading = true;
    if (notify) notifyListeners();
  }

  /// hide loading indicator
  void hideLoading() {
    _loading = false;
    notifyListeners();
  }

  leadershipViewmodel() async {
    try {
      // showLoading(notify: false);
      final _response = await _leadershipRepository.leadership();
      leadership = _response;
    } catch (e) {
      // throw(e);
      showsnackBarInfo(this._context, message: e.toString());
    }
    hideLoading();
    return leadership;
  }
}
