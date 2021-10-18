import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../../helper/helper_handler.dart';
import '../viewmodel/network_viewmodel.dart';
import '../../profile/dao/profile_dao.dart';
import '../../profile/model/users_profile_model.dart';
import '../../../widget/multi_color_widget.dart';
import '../../../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

class MyVPPTab extends StatefulWidget {
  MyVPPTab({Key? key}) : super(key: key);

  @override
  _MyVPPTabState createState() => _MyVPPTabState();
}

class _MyVPPTabState extends State<MyVPPTab> {
  NetworkViewModel? _viewModel;

  @override
  void initState() {
    _viewModel = Provider.of<NetworkViewModel>(context, listen: false);
    _viewModel!.init(context);
    _viewModel!.getUsersVPP();
    super.initState();
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
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: provider.vppData.length,
          itemBuilder: (context, index) {
            final _lead = provider.vppData[index];
            return Text(_lead.name ?? '');
          });
    });
  }
}
