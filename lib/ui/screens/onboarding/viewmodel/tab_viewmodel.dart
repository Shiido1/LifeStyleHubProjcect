import 'package:lifestyle_hub/provider/_base_viewmodels.dart';

class TabViewModel extends BaseViewModel {
  int _index = 0;

  int get index => _index;

  void switchIndex(int i) {
    _index = i;
    notifyListeners();
  }

  @override
  void dispose() {
    _index = 0;
    super.dispose();
  }
}
