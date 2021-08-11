import 'package:lifestyle_hub/provider/_base_viewmodels.dart';

class TabViewModel extends BaseViewModel {
  int _index = 0;

  int get index => _index;

  bool _isNextTab = false;

  bool get isNextTab => _isNextTab;

  void switchIndex(int i) {
    _index = i;
    if (i >= 2) {
      _isNextTab = true;
    } else {
      _isNextTab = false;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _index = 0;
    _isNextTab = false;
    super.dispose();
  }
}
