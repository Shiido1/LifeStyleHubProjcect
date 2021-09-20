import 'package:dio/dio.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/change_password.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../utils/paths.dart';
import '../model/users_profile_model.dart';

class ProfileRepository {
  /// get users profile
  Future<UsersProfileModel> getUsersProfile() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.profile, options: await getDioHeader());
      return UsersProfileModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// updates a users profile
  Future<UsersProfileModel> updateAUsersProfile(body) async {
    try {
      final _response = await apiBaseHelper.patch(Paths.user, body,
          options: await getDioHeader());
      return UsersProfileModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// updates a users next of kin
  Future<Nok> updateUsersNexOfKin(FormData body) async {
    try {
      final _response = await apiBaseHelper.post(
          map: body, url: Paths.userNOK, options: await getDioHeader());
      return Nok.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// updates a users next of kin
  Future<Work> updateUsersWork(FormData body) async {
    try {
      final _response = await apiBaseHelper.post(
          map: body, url: Paths.updateUsersWork, options: await getDioHeader());
      return Work.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// updates a users bank informations
  Future<dynamic> updateUsersBankInformation(Map body) async {
    try {
      final _response = await apiBaseHelper.post(
          map: body, url: Paths.updateUsersBank, options: await getDioHeader());
      return null;
    } catch (e) {
      throw e;
    }
  }

  /// change users password
  Future<ChangePassword> changeUsersPassword(Map body) async {
    try {
      final _response = await apiBaseHelper.post(
          map: body, url: Paths.changePassword, options: await getDioHeader());
      return ChangePassword.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
