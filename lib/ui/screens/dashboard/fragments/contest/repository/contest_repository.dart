import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/create_contest.dart';
import '../model/delete_contest_model.dart';
import '../model/view_contest_model.dart';
import '../../../../../../utils/paths.dart';

class ContestRepository {
  /// [@CREATE] contest
  Future<CreateOrUpdateContestModel> createContest(Map map,
      {String id = ''}) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map,
          url:
              '${Paths.createUpdateDeleteContest}${id.isNotEmpty ? '/$id' : ''}',
          options: await getDioHeader());
      return CreateOrUpdateContestModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] contest list
  Future<ViewContestModelList> getListContest() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.viewContest, options: await getDioHeader());
      return ViewContestModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] contest
  Future<ViewContestModel> getContest({required String id}) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.viewContest}/$id', options: await getDioHeader());
      return ViewContestModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Delete] Resource marketting details
  Future<DeleteContestModel> deleteContest(String id) async {
    try {
      final _response = await apiBaseHelper.delete(
          url: '${Paths.createUpdateDeleteContest}/$id',
          options: await getDioHeader());
      return DeleteContestModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
