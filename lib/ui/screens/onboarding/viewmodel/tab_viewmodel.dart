import 'package:flutter/cupertino.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/dashboard.dart';
import 'package:page_transition/page_transition.dart';

class TabViewModel extends BaseViewModel {
  int? _index = 0;
  bool? _isFromDrawer = true;

  int? get index => _index;

  bool? get isFromDrawer => _isFromDrawer;

  void switchIndex(int i) {
    _index = i;
    notifyListeners();
  }

  void switchDrawerIndex(BuildContext context, int i, {bool? drawer = true}) {
    this._isFromDrawer = drawer;
    _index = i;
    notifyListeners();

    PageRouter.gotoWidget(DashboardScreen(index: i), context,
        animationType: PageTransitionType.fade);
  }

  @override
  void dispose() {
    _index = 0;
    super.dispose();
  }
}
