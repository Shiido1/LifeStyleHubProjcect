import 'dart:async';
import 'package:lifestyle_hub/ui/screens/onboarding/tabs/model/country_model.dart';

import '../../../../helper/helper_handler.dart';
import '../../../../helper/configs/instances.dart';
import '../model/basic_information_model.dart';
import '../model/work_information_model.dart';
import '../../../../utils/paths.dart';

class InformationRepository {
  /// register basic information
  Future<BasicInformationModel> registerBasicInformation(
      {required Map map}) async {
    logger.d(map);
    final _response = await apiBaseHelper.post(
        url: Paths.basicInformation, map: map, options: await getDioHeader());
    logger.d(map);
    return BasicInformationModel.fromJson(_response);
  }

  /// register work and banking information
  Future<WorkInformationModel> registerWorkAndInInformation(
      {required Map map}) async {
    try {
      final _response = await apiBaseHelper.post(
          url: Paths.workAndBanking, map: map, options: await getDioHeader());

      return WorkInformationModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<CountryModelList> countriesRepo() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.countries, options: await getDioHeader());
      return CountryModelList.fromJson(_response);
    } catch (e) {
      throw (e);
    }
  }
}
