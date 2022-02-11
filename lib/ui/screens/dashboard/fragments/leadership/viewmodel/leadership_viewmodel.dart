import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/leadership/model/leadership_response_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/leadership/repository/repo.dart';

LeadershipRepository _leadersipRepository = LeadershipRepository();

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

  Future<void> leadershipViewmodel() async {
    try {
      showLoading(notify: false);
      final _reponse = await _leadersipRepository.leadership();
      leadership = _reponse;
      logger.d(leadership!.leaderships!.length);
    } catch (e) {
      
    }
    hideLoading();
  }
}
