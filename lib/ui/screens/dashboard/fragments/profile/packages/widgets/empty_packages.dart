import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import '../purchase_package_screen.dart';

class EmptyPackageWidget extends StatelessWidget {
  const EmptyPackageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      width: getDeviceWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextView(
            text: 'Active Packages',
            color: Pallets.grey500,
            fontSize: 16.sp,
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
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 20.h,
          ),
          ButtonWidget(
            buttonText: 'Subscribe now',
            width: 200.w,
            color: Pallets.white,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            fontStyle: FontStyle.normal,
            borderColor: Pallets.orange500,
            primary: Pallets.orange500,
            onPressed: () =>
                PageRouter.gotoWidget(PurchasePackageScreen(), context),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Pallets.grey100,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
    ));
  }
}
