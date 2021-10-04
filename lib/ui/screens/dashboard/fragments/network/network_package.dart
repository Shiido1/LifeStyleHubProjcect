import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import 'model/view_account_model.dart';
import 'viewmodel/network_viewmodel.dart';

class PackageCallBack extends StatefulWidget {
  final Function(ViewAccountResponse response)? onTap;

  PackageCallBack({Key? key, required this.onTap}) : super(key: key);

  @override
  State<PackageCallBack> createState() => _PackageCallBackState();
}

class _PackageCallBackState extends State<PackageCallBack> {
  NetworkViewModel? _viewModel;

  @override
  void initState() {
    _viewModel = Provider.of<NetworkViewModel>(context, listen: false);
    _viewModel!.init(context);
    _viewModel!.getNetworkAccount();
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Packages',
          showLeadig: true,
          showImage: false,
          showMoreMenu: true,
          centerTitle: true,
          onTap: () => null),
      body: Consumer<NetworkViewModel>(builder: (_, provider, __) {
        if (provider.loading) {
          return Center(
            child: SpinKitCubeGrid(
              color: Pallets.orange600,
            ),
          );
        }
        return ListView(
          children: provider.viewAccountResponseList!
              .map((element) => ListTile(
                    onTap: () {
                      widget.onTap!(element);
                      PageRouter.goBack(context);
                    },
                    title: TextView(
                      text: element.package?.name ?? '',
                      fontSize: 14,
                      textAlign: TextAlign.left,
                      color: Pallets.grey700,
                    ),
                  ))
              .toList(),
        );
      }),
    );
  }
}
