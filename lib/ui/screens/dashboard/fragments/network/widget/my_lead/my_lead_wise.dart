import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/multi_color_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import '../history_cards.dart';

class MyLeadWiseTab extends StatefulWidget {
  MyLeadWiseTab({Key? key}) : super(key: key);

  @override
  _MyLeadWiseTabState createState() => _MyLeadWiseTabState();
}

class _MyLeadWiseTabState extends State<MyLeadWiseTab> {
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
    _viewModel!.getUsersLeadWise(_profileModel!.id!);
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
          ViewAllButton(title: 'My lead', viewAll: () => null),
          SizedBox(height: 16),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: provider.leadsWise.length <= 5
                  ? provider.leadsWise.length
                  : 5,
              itemBuilder: (context, index) {
                final element = provider.leadsWise[index];
                return HistroyCard(
                    historyValues: HistoryValues(
                        name: element.name ?? '',
                        email: element.email ?? '',
                        date: fomartDate(element.createdAt!),
                        packageName: 'Package Name',
                        referral: element.referredBy ?? 'N/A'));
              }),
        ],
      );
      ;
    });
  }
}
