import 'dart:async';
import '../../../../helper/helper_handler.dart';
import '../../../../helper/configs/instances.dart';
import '../model/basic_information_model.dart';
import '../model/work_information_model.dart';
import '../../../../utils/paths.dart';

class InformationRepository {
  /// register basic information
  Future<BasicInformationModel> registerBasicInformation(
      {required Map map}) async {
    final _response = await apiBaseHelper.post(
        url: Paths.basicInformation, map: map, options: await getDioHeader());
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
}
