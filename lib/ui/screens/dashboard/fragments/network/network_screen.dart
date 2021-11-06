import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/data/tabs_data.dart';
import '../../../../../helper/configs/instances.dart';
import '../../../../../helper/routes/navigation.dart';
import 'viewmodel/network_viewmodel.dart';
import 'widget/my_downline/my_downline.dart';
import 'widget/my_lead/my_lead_wise.dart';
import 'package:provider/provider.dart';
import '../../../../../helper/helper_handler.dart';
import '../../widget/second_icon.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';

import 'model/view_account_model.dart';
import 'network_package.dart';
import 'widget/custom_tab.dart';
import 'widget/my_matrix/matrix_build.dart';
import 'widget/my_generation/my_generation.dart';
import 'widget/vpp/my_vpp.dart';

class NetworkScreen extends StatefulWidget {
  NetworkScreen({Key? key}) : super(key: key);

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  NetworkViewModel? _viewModel;
  ViewAccountResponse? _response;

  final TextEditingController _controller = TextEditingController();

  int _index = 0;

  @override
  void initState() {
    _viewModel = Provider.of<NetworkViewModel>(context, listen: false);
    _viewModel!.init(context);
    _getFirstItem();
    super.initState();
  }

  void _getFirstItem() async {
    List<ViewAccountResponse> _items =
        await _viewModel!.getNetworkAccount(notify: false);
    if (_items.isNotEmpty) {
      _response = _items.first;
      _controller.text = _response?.package?.name ?? '';
      setState(() {});
      _viewModel!.getNetworkAccountDetails(_response!.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: TabsData.tabsList()
                  .map((tab) => Tabs(
                        text: tab.text,
                        isSelected: tab.id == _index,
                        onTap: () => setState(() => _index = tab.id!),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          _returnBody(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _returnBody() {
    if (_index == 0) {
      return MatrixBuild(
        response: _response,
        controller: _controller,
        networkViewModel: _viewModel,
        onTap: () {
          PageRouter.gotoWidget(PackageCallBack(onTap: (response) {
            _response = response;
            _controller.text = _response?.package?.name ?? '';
            setState(() {});
            _viewModel!.getNetworkAccountDetails(_response!.id!);
          }), context);
        },
      );
    }

    if (_index == 1) {
      return MyDownlineTab();
    }
    if (_index == 2) {
      return MyGenerationTab();
    }

    if (_index == 3) {
      return MyLeadWiseTab();
    }

    return MyVPPTab();
  }
}
