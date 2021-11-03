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
      final _login = LoginModel.fromJson(_response);

      /// cache login data
      SessionManager.instance.authToken = _login.token!;

      /// cache users wallet
      SessionManager.instance.userWallet = _login.user!.wallet!.toJson();

      /// requests for users profile
      final _usersInformationResponse =
          await _profileRepository.getUsersProfile();

      /// requests for users dashboard
      final _dashboard = await _dashboardRepository.dashboard();

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
