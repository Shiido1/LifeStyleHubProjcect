import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/widget/my_downline/my_downline.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/widget/my_lead/my_lead_wise.dart';
import 'package:provider/provider.dart';
import '../../../../../helper/helper_handler.dart';
import '../../widget/second_icon.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';

import 'model/generation_model.dart';
import 'model/view_account_model.dart';
import 'network_package.dart';
import 'widget/custom_tab.dart';
import 'widget/my_matrix/matrix_widget.dart';
import 'widget/my_generation/my_generation.dart';
import 'widget/my_vpp.dart';

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
    super.initState();
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
              children: [
                Tabs(
                  text: 'Matrix tree view',
                  isSelected: _index == 0 ? true : false,
                  onTap: () => setState(() => _index = 0),
                ),
                SizedBox(
                  width: 16,
                ),
                Tabs(
                  text: 'My downline',
                  isSelected: _index == 1 ? true : false,
                  onTap: () => setState(() => _index = 1),
                ),
                SizedBox(
                  width: 16,
                ),
                Tabs(
                  text: 'Generation downline',
                  isSelected: _index == 2 ? true : false,
                  onTap: () => setState(() => _index = 2),
                ),
                SizedBox(
                  width: 16,
                ),
                Tabs(
                  text: 'My Lead-wise downline',
                  isSelected: _index == 3 ? true : false,
                  onTap: () => setState(() => _index = 3),
                ),
                SizedBox(
                  width: 16,
                ),
                Tabs(
                  text: 'My VPP Team',
                  isSelected: _index == 4 ? true : false,
                  onTap: () => setState(() => _index = 4),
                ),
              ],
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
      return _buildMatrixTree();
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

  _buildMatrixTree() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: _response?.package?.name ?? '',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.left,
          color: Pallets.grey800,
          maxLines: 1,
        ),
        SizedBox(
          height: 8,
        ),
        TextView(
          text: _response?.package?.type ?? '',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.left,
          color: Pallets.orange500,
          maxLines: 1,
        ),
        SizedBox(
          height: 24,
        ),
        EditFormField(
          floatingLabel: '',
          label: _response?.package?.name ?? '',
          controller: _controller,
          keyboardType: TextInputType.text,
          onChange: (value) {},
          readOnly: true,
          onTapped: () =>
              PageRouter.gotoWidget(PackageCallBack(onTap: (response) {
            _response = response;
            _controller.text = _response?.package?.name ?? '';
            setState(() {});
            _viewModel!.getNetworkAccountDetails(_response!.id!);
          }), context),
          suffixIcon: Icons.keyboard_arrow_down,
          suffixIconColor: Pallets.disabledIconColor,
        ),
        SizedBox(
          height: 36,
        ),
        Consumer<NetworkViewModel>(builder: (_, provider, __) {
          if (provider.loading) {
            return Center(
              child: SpinKitCubeGrid(
                color: Pallets.orange600,
              ),
            );
          }
          return MatrixDisplayWidget(
            me: Me.getMyDescendants(),
            network: provider.accountNetworkResponse,
            networkViewModel: _viewModel,
          );
        }),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Check this package out',
          color: Pallets.white,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          primary: Pallets.grey300,
          borderColor: Pallets.grey300,
          onPressed: () => null,
        ),
      ],
    );
  }
}
