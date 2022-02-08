import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/viewmodel/package_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/informations.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import '../purchase_package_screen.dart';

class EmptyPackageWidget extends StatefulWidget {
  const EmptyPackageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EmptyPackageWidget> createState() => _EmptyPackageWidgetState();
}

class _EmptyPackageWidgetState extends State<EmptyPackageWidget> {
  PackageViewmodel? _packageViewmodel;

  @override
  void initState() {
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel!.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        width: getDeviceWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextView(
              text: 'Active Packages',
              color: Pallets.grey500,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            ImageLoader(
              path: AppImages.emptyFolder,
              height: 80,
              width: 80,
            ),
            TextView(
              text: ' No active packages',
              color: Pallets.grey400,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              buttonText: 'Subscribe now',
              width: 200,
              color: Pallets.white,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              fontStyle: FontStyle.normal,
              borderColor: Pallets.orange500,
              primary: Pallets.orange500,
              onPressed: () => _packageViewmodel!.activePackages!.isEmpty
                  ? PageRouter.gotoWidget(GetStartedScreen(), context)
                  : PageRouter.gotoWidget(PurchasePackageScreen(), context),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Pallets.grey100,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
