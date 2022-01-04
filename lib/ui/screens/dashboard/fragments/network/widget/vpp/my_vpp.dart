import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/my_vpp_response.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/vpp/vpp_profile.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/pop_menu/items.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/pop_menu/pop_up_menu.dart';
import '../../viewmodel/network_viewmodel.dart';
import '../../../../../../../utils/pallets.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/widget/vpp_team_card_widget.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
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
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: provider.vppData
            .map((lead) => VppTeamCardWidget(
                email: lead.email ?? '',
                bgColor: Pallets.orange50,
                signUpCount: lead.signupCount ?? 0,
                date: lead.updatedAt ?? '',
                name: lead.name ?? '',
                menu: PopMenuWidget(
                  menuItems: PostsMenuModel.postMenu(),
                  menuCallback: (PopMenuOptions option) {
                    _options(option, lead);
                    controller.hideMenu();
                  },
                )))
            .toList(),
      );
    });
  }

  void _options(PopMenuOptions option, Data lead) {
    switch (option) {
      case PopMenuOptions.viewProfile:
        PageRouter.gotoWidget(
            VPPInformationsScreen(lead, isUpdate: true), context);
        break;
      case PopMenuOptions.setCommission:
        
        break;
      case PopMenuOptions.deactivateVPP:
        _viewModel!.deactivateVPP(lead.id!);
        break;
    }
  }
}
