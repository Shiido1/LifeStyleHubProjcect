import '../../../../../../helper/configs/constants.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/delete_marketting_model.dart';
import '../model/get_resources_model.dart';
import '../model/update_resource_model.dart';
import '../../../../../../utils/paths.dart';

class MarkettingRepository {
  /// [@CREATE] Resource marketting list
  Future<dynamic> createMarketting(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map, url: Paths.getMarketting, options: await getDioHeader());
      return null;
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] Resource marketting list
  Future<GetResourcesModelList> getMarketting() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.getMarketting, options: await getDioHeader());
      return GetResourcesModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] Resource marketting list
  Future<GetResourcesModelList> getMarkettingAll(String type,
      {int? page}) async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.getMarketting,
          queryParameters: {'type': type, 'page': page, 'per_page': 20},
          options: await getDioHeader());
      return GetResourcesModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] Resource marketting details
  Future<Data> getMarkettingDetails(String id) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.getMarketting}/$id', options: await getDioHeader());
      return Data.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Update] Resource marketting details
  Future<UpdateResourceModel> updateMarkettingDetails(String id,
      {required dynamic formData}) async {
    try {
      final _response = await apiBaseHelper.put(
          url: '${Paths.updateMarketting}/$id',
          map: formData!,
          options: await getDioHeader());
      return UpdateResourceModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Delete] Resource marketting details
  Future<DeleteResourceModel> deleteMarkettingDetails(String id) async {
    try {
      final _response = await apiBaseHelper.delete(
          url: '${Paths.updateMarketting}/$id', options: await getDioHeader());
      return DeleteResourceModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
