import 'package:flutter/cupertino.dart';
import '../../../../helper/routes/navigation.dart';
import '../../../../provider/_base_viewmodels.dart';
import '../../dashboard/dashboard.dart';
import 'package:page_transition/page_transition.dart';

class TabViewModel extends BaseViewModel {
  int? _index = 0;
  bool? _isFromDrawer = true;

  int? get index => _index;

  bool? get isFromDrawer => _isFromDrawer;

  void switchIndex(int i, {bool notify = true}) {
    _index = i;
    if (notify) notifyListeners();
  }

  void switchDrawerIndex(BuildContext context, int i,
      {bool? drawer = true, bool? notify = true}) {
    this._isFromDrawer = drawer;
    _index = i;
    if (notify!) notifyListeners();

    PageRouter.gotoWidget(DashboardScreen(index: i), context,
        animationType: PageTransitionType.fade);
  }

  @override
  void dispose() {
    _index = 0;
    super.dispose();
  }
}
