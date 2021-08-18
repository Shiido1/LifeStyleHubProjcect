import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/contest/model/create_contest.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/contest/model/delete_contest_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/contest/model/view_contest_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class ContestRepository {
  /// [@CREATE] contest
  Future<CreateOrUpdateContestModel> createContest(Map map,
      {String id = ''}) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map,
          url:
              '${Paths.createUpdateDeleteContest}${id.isNotEmpty ? '/$id' : ''}',
          header: await getHeader());
      return CreateOrUpdateContestModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] contest
  Future<ViewContestModel> getContest({String id = ''}) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.viewContest}${id.isNotEmpty ? '/$id' : ''}',
          header: await getHeader());
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
          header: await getHeader());
      return DeleteContestModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
