import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/provider/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class WorkInformationWidget extends StatelessWidget {
  const WorkInformationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tabViewModel = Provider.of<TabViewModel>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Work / Banking',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Pallets.grey800,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8,
        ),
        TextView(
          text:
              'This is a KYC to  understand where and how money comes into our network',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Pallets.grey700,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Occupation / work',
          label: 'Occupation / work',
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Industry',
          label: 'Industry',
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Official address',
          label: 'Official address',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: Pallets.disabledIconColor,
        ),
        SizedBox(
          height: 32,
        ),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Next',
          color: Pallets.white,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          primary: Pallets.orange600,
          onPressed: () => _tabViewModel.switchIndex(3),
        ),
        SizedBox(
          height: 24,
        ),
        Center(
          child: TextView(
            text: 'Skip & start 14 days free trial',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Pallets.grey500,
            textAlign: TextAlign.center,
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
