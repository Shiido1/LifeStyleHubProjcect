import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/dao/account_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/widget/history_cards.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/multi_color_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import 'view_all_my_downline.dart';

class MyDownlineTab extends StatefulWidget {
  MyDownlineTab({Key? key}) : super(key: key);

  @override
  _MyDownlineTabState createState() => _MyDownlineTabState();
}

class _MyDownlineTabState extends State<MyDownlineTab> {
  NetworkViewModel? _viewModel;

  @override
  void initState() {
    _viewModel = Provider.of<NetworkViewModel>(context, listen: false);
    _viewModel!.init(context);
    _getCatchedInfos();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    _viewModel!.getUsersDownline(_profileModel!.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkViewModel>(builder: (_, provider, __) {
      if (provider.loading) {
        return Center(
          child: SpinKitCubeGrid(
            color: Pallets.orange600,
          ),
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: getDeviceWidth(context),
            padding: EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Pallets.blue50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  text: 'Total downline',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Pallets.grey600,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                TextView(
                  text: '\$10,000',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Pallets.black,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                TextView(
                  text: 'ACROSS PACKAGES',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Pallets.grey600,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          ViewAllButton(
              title: 'Downline history',
              viewAll: () =>
                  PageRouter.gotoWidget(ViewMyDownlinesScreen(), context)),
          SizedBox(height: 16),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: provider.downlineResponse!.length <= 5
                  ? provider.downlineResponse!.length
                  : 5,
              itemBuilder: (context, index) {
                final element = provider.downlineResponse![index];
                return HistroyCard(
                    historyValues: HistoryValues(
                        name: element.user?.name ?? '',
                        email: element.user?.email ?? '',
                        date: fomartDate(element.createdAt!),
                        packageName: element.package?.name ?? 'N/A',
                        referral: 'Referal Name here'));
              }),
        ],
      );
    });
  }
}
