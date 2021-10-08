import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/widget/history_cards.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class ViewMyDownlinesScreen extends StatefulWidget {
  ViewMyDownlinesScreen({Key? key}) : super(key: key);

  @override
  _ViewMyDownlinesScreenState createState() => _ViewMyDownlinesScreenState();
}

class _ViewMyDownlinesScreenState extends State<ViewMyDownlinesScreen> {
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
        children: provider.downlineResponse!
            .map((element) => HistroyCard(
                  historyValues: HistoryValues(
                      name: element.user?.name ?? '',
                      email: element.user?.email ?? '',
                      date: fomartDate(element.createdAt!),
                      packageName: element.package?.name ?? 'M/A',
                      referral: 'Referal Name here'),
                ))
            .toList(),
      );
    });
  }
}
