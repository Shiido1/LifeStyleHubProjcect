import '../../../../../../../helper/configs/instances.dart';
import '../../../../../../../helper/helper_handler.dart';
import '../model/my_accounts_model.dart';
import '../model/packages_payment_model.dart';
import '../model/view_packages_model.dart';
import '../../../../../../../utils/paths.dart';

class PackageRepository {
  /// [@PAYMENT] package subscription
  Future<PackagesPaymentModel> payment(String id, Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map,
          url: '${Paths.packages}/$id/subscribe',
          options: await getDioHeader());
      return PackagesPaymentModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] List of packages
  Future<ViewPackagesModelList> getListOfPackages() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.packages, options: await getDioHeader());
      return ViewPackagesModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] package details
  Future<ViewPackagesModel> getPackageDetail(String id) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.packages}/$id', options: await getDioHeader());
      return ViewPackagesModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] profile accounts
  Future<MyAccountsModelList> getMyAccountPackages() async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.accounts}', options: await getDioHeader());
      return MyAccountsModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
