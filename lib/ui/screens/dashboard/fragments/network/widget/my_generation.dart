import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/multi_color_widget.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class MyGenerationTab extends StatefulWidget {
  MyGenerationTab({Key? key}) : super(key: key);

  @override
  _MyGenerationTabState createState() => _MyGenerationTabState();
}

class _MyGenerationTabState extends State<MyGenerationTab> {
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
    _viewModel!.getUsersGenerationDownline(_profileModel!.id!);
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
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: provider.generationData.length,
          itemBuilder: (context, index) {
            final _generation = provider.generationData[index];
            return MultiColorWidget(
                title: _generation.user?.name ?? 'N/A',
                bgColor: index % 2 == 0 ? Pallets.orange100 : Pallets.white,
                package: _generation.package?.name ?? 'N/A',
                points: _generation.points ?? 'N/A',
                date: fomartDate(_generation.createdAt!));
          });
    });
  }
}
