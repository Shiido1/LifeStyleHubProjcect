import 'package:dio/dio.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/users_profile_model.dart';
import '../../../../../../utils/paths.dart';

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
  Future<dynamic> updateAUsersProfile(FormData body) async {
    try {
      final _response = await apiBaseHelper.post(
          map: body, url: Paths.user, options: await getDioHeader());
      return null;
    } catch (e) {
      throw e;
    }
  }

  /// updates a users next of kin
  Future<dynamic> updateUsersNexOfKin(Map body) async {
    try {
      final _response = await apiBaseHelper.post(
          map: body, url: Paths.userNOK, options: await getDioHeader());
      return null;
    } catch (e) {
      throw e;
    }
  }

  /// updates a users next of kin
  Future<dynamic> updateUsersWork(Map body) async {
    try {
      final _response = await apiBaseHelper.post(
          map: body, url: Paths.updateUsersWork, options: await getDioHeader());
      return null;
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
}
