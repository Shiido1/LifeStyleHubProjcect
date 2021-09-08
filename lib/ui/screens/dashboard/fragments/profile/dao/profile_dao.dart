import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';

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
    logger.d(usersProfileModel.toJson());
    await _box!.put(HiveBoxes.profile, usersProfileModel.toJson());
  }

  UsersProfileModel convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return UsersProfileModel.fromJson(raw[HiveBoxes.profile]);
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
