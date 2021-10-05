import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/multi_color_widget.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

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
    _viewModel!.getUsersDownline(33);
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
          itemCount: provider.downlineResponse?.length ?? 0,
          itemBuilder: (context, index) {
            final _downline = provider.downlineResponse?[index];
            return MultiColorWidget(
                title: _downline?.user?.name ?? 'N/A',
                bgColor: index % 2 == 0 ? Pallets.orange100 : Pallets.white,
                package: _downline?.package?.name ?? 'N/A',
                points: _downline?.points ?? 'N/A',
                date: fomartDate(_downline!.createdAt!));
          });
    });
  }
}
