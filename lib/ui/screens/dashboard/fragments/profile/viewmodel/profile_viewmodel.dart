import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../dao/profile_dao.dart';
import '../repository/profile_repository.dart';

ProfileRepository _profileRepository = ProfileRepository();

class ProfileViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  /// initialize auth viewmodel
  void init(BuildContext context) {
    this._context = context;
  }

  /// show loading indicator
  void _showLoading({bool notify = false}) {
    _loading = true;
    if (notify) notifyListeners();
  }

  /// hide loading indicator
  void _hideLoading() {
    _loading = false;
    notifyListeners();
  }

  /// get users profile
  Future<void> getUsersProfile() async {
    try {
      if (profileDao!.box!.isEmpty) _showLoading();
      final _response = await _profileRepository.getUsersProfile();
      profileDao!.saveProfile(_response);
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// update a users profile
  Future<void> updateUsersProfile(formData) async {
    try {
      _showLoading(notify: true);
      final _response = await _profileRepository.updateAUsersProfile(formData);
      profileDao!.saveProfile(_response);
      showsnackBarInfo(_context,
          message: 'Update successful', bgColor: Pallets.green600);
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// update users next of kin
  Future<void> updateUsersNextKin(FormData map) async {
    try {
      _showLoading(notify: true);
      await _profileRepository.updateUsersNexOfKin(map);
      await getUsersProfile();
      showsnackBarInfo(_context, message: 'Update successful');
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// update users next work information
  Future<void> updateUsersWorkInfo(FormData map) async {
    try {
      _showLoading();
      await _profileRepository.updateUsersWork(map);
      await getUsersProfile();
      showsnackBarInfo(_context,
          message: 'Update successful', bgColor: Pallets.green600);
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// update users next bank information
  Future<void> updateUsersBank(Map map) async {
    try {
      _showLoading();
      final _response =
          await _profileRepository.updateUsersBankInformation(map);
      await getUsersProfile();
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// change users password
  Future<void> changeUsersPassword(Map map) async {
    try {
      _showLoading(notify: true);
      final _response = await _profileRepository.changeUsersPassword(map);
      showsnackBarInfo(_context,
          message: _response.message ?? '', bgColor: Pallets.green600);
    } catch (e) {
      showsnackBarInfo(_context, message: e.toString());
    }
    _hideLoading();
  }
}
