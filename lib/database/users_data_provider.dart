import '../helper/configs/constants.dart';
import '../helper/configs/instances.dart';
import '../provider/_base_viewmodels.dart';
import '../ui/screens/login/model/login_model.dart';

class UsersInfoViewModel extends BaseViewModel {
  User _user = User();

  User get user => _user;

  /// get users credentials
  Future<User> getUsersData() async {
    var _data = await prefManager.getCachedData(key: AppConstants.usersPrefKey);
    LoginModel _login = LoginModel.fromJson(_data);
    _user = _login.user!;
    notifyListeners();
    return _user;
  }
}
