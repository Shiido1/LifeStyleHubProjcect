import 'dart:html';

import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/delete_marketting_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/update_resource_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class MarkettingRepository {
  /// [@CREATE] Resource marketting list
  Future<dynamic> createMarketting(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map, url: Paths.getMarketting, header: await getHeader());
      return null;
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] Resource marketting list
  Future<GetResourcesModelList> getMarketting() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.getMarketting, header: await getHeader());
      return GetResourcesModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] Resource marketting details
  Future<GetResourcesModel> getMarkettingDetails(String id) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.getMarketting}/$id', header: await getHeader());
      return GetResourcesModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Update] Resource marketting details
  Future<UpdateResourceModel> updateMarkettingDetails(String id,
      {required FormData? formData}) async {
    try {
      final _response = await apiBaseHelper.put(
          url: '${Paths.updateMarketting}/$id',
          map: formData!,
          header: await getHeader());
      return UpdateResourceModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Delete] Resource marketting details
  Future<DeleteResourceModel> deleteMarkettingDetails(String id) async {
    try {
      final _response = await apiBaseHelper.delete(
          url: '${Paths.updateMarketting}/$id', header: await getHeader());
      return DeleteResourceModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
