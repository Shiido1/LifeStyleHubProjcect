import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/model/package_subcription_response.dart';

import '../../../../../../../helper/configs/instances.dart';
import '../../../../../../../helper/helper_handler.dart';
import '../model/my_accounts_model.dart';
import '../model/packages_payment_model.dart';
import '../model/view_packages_model.dart';
import '../../../../../../../utils/paths.dart';

class PackageRepository {
  /// [@PAYMENT] package subscription
  Future<PackagesPaymentModel> payment(int id, Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map,
          url: '${Paths.availablePackages}/$id/subscribe',
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

  /// [@Get] packages for purchase
  Future<PackageSubcriptionResponseList> getAvailablePackages() async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.availablePackages}', options: await getDioHeader());
      return PackageSubcriptionResponseList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
