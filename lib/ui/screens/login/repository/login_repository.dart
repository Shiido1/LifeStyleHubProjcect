import 'dart:async';

import '../../../../core/data/session_manager.dart';
import '../../dashboard/dao/dashboardd_dao.dart';
import '../../dashboard/fragments/profile/dao/profile_dao.dart';
import '../../dashboard/fragments/profile/repository/profile_repository.dart';
import '../../dashboard/repository/dashboard_repository.dart';

import '../../../../helper/configs/instances.dart';
import '../../../../utils/paths.dart';
import '../model/login_model.dart';

final ProfileRepository _profileRepository = ProfileRepository();
final DashboardRepository _dashboardRepository = DashboardRepository();

class LoginRepository {
  Future<LoginModel> login({required Map map}) async {
    try {
      final _response = await apiBaseHelper.post(url: Paths.login, map: map);

      logger.d(_response);
      final _login = LoginModel.fromJson(_response);

      /// cache login data
      SessionManager.instance.authToken = _login.token!;


      /// requests for users profile
      final _usersInformationResponse =
          await _profileRepository.getUsersProfile();

      bool _user = _login.user?.role == "user";

      /// requests for users dashboard
      final _dashboard = await _dashboardRepository.dashboard(_user);

      /// cache users profile
      profileDao!.saveProfile(_usersInformationResponse);

      /// cache users dashboard
      dashboardDao!.saveDashboard(_dashboard.toJson());

      return _login;
    } catch (e) {
      throw e;
    }
  }
}
