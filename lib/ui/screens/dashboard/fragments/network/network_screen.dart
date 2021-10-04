import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
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
import 'widget/matrix_widget.dart';

class NetworkScreen extends StatefulWidget {
  NetworkScreen({Key? key}) : super(key: key);

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  NetworkViewModel? _viewModel;
  ViewAccountResponse? _response;

  final TextEditingController _controller = TextEditingController();

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
                  isSelected: true,
                  onTap: () {},
                ),
                SizedBox(
                  width: 30,
                ),
                Tabs(
                  text: 'My downline',
                  isSelected: false,
                  onTap: () {},
                ),
                SizedBox(
                  width: 30,
                ),
                Tabs(
                  text: 'Generation downline',
                  isSelected: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
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
          SizedBox(
            height: 40,
          ),
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
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  final String? text;
  final bool isSelected;
  final Function()? onTap;

  Tabs({required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Pallets.orange50 : Colors.transparent,
            borderRadius: BorderRadius.circular(19)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextView(
          text: text!,
          fontSize: 14,
          textAlign: TextAlign.center,
          color: Pallets.grey700,
        ),
      ),
    );
  }
}
