import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/generation_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/view_account_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import 'matrix_widget.dart';

class MatrixBuild extends StatelessWidget {
  final ViewAccountResponse? response;
  final Function()? onTap;
  final NetworkViewModel? networkViewModel;
  final TextEditingController? controller;
  const MatrixBuild(
      {this.response,
      this.controller,
      this.networkViewModel,
      this.onTap,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: response?.package?.name ?? '',
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
          text: response?.package?.type ?? '',
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
          label: response?.package?.name ?? '',
          controller: controller,
          keyboardType: TextInputType.text,
          onChange: (value) {},
          readOnly: true,
          onTapped: onTap,
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
            networkViewModel: networkViewModel,
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
