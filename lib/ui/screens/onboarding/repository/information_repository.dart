import 'dart:async';

import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/login/model/login_model.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/model/basic_information_model.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/model/work_information_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class InformationRepository {

  /// register basic information
  Future<BasicInformationModel> registerBasicInformation({required Map map}) async {
    try {
      final _response = await apiBaseHelper.post(url: Paths.basicInformation, map: map);
      return BasicInformationModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// register work and banking information
  Future<WorkInformationModel> registerWorkAndInInformation({required Map map}) async {
    try {
      final _response = await apiBaseHelper.post(url: Paths.workAndBanking, map: map);
      return WorkInformationModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
