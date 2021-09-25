import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';

import '../../../../../../database/hive_database.dart';
import '../model/users_profile_model.dart';

ProfileDao? profileDao;

class ProfileDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  ProfileDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.profile);
  }

  Future<void> saveProfile(UsersProfileModel usersProfileModel) async {
    await prefManager.saveValue(
        key: HiveBoxes.profile, value: usersProfileModel.toJson());
  }

  Future<UsersProfileModel> convert() async{
    final _raw = await prefManager.getCachedData(key: HiveBoxes.profile);
    return UsersProfileModel.fromJson(_raw);
  }
  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
