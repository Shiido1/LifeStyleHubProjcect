import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/repository/profile_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  Future<void> updateUsersProfile(FormData formData) async {
    try {
      _showLoading();
      final _response = await _profileRepository.updateAUsersProfile(formData);
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// update users next of kin
  Future<void> updateUsersNextKin(Map map) async {
    try {
      _showLoading();
      final _response = await _profileRepository.updateUsersNexOfKin(map);
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// update users next work information
  Future<void> updateUsersWorkInfo(Map map) async {
    try {
      _showLoading();
      final _response = await _profileRepository.updateUsersWork(map);
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
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }
}
