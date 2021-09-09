import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import '../../../../helper/configs/constants.dart';
import '../../../../helper/configs/instances.dart';
import '../model/basic_information_model.dart';
import '../model/work_information_model.dart';
import '../../../../utils/paths.dart';

class InformationRepository {
  /// register basic information
  Future<BasicInformationModel> registerBasicInformation(
      {required Map map}) async {
    final _response = await apiBaseHelper.post(
        url: Paths.basicInformation,
        map: map,
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              '${AppConstants.bearer!}${AppConstants.tempToken!}'
        }));
    return BasicInformationModel.fromJson(_response);
  }

  /// register work and banking information
  Future<WorkInformationModel> registerWorkAndInInformation(
      {required Map map}) async {
    try {
      final _response = await apiBaseHelper.post(
          url: Paths.workAndBanking,
          map: map,
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                '${AppConstants.bearer!}${AppConstants.tempToken!}'
          }));

      return WorkInformationModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
