import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/helper/routes/routes.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/provider/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class BankInformationWidget extends StatelessWidget {
  const BankInformationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tabViewModel = Provider.of<TabViewModel>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Banking Information',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Pallets.grey800,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 32,
        ),
        EditFormField(
          floatingLabel: 'Name of the account',
          label: 'Name of the account',
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Account number',
          label: 'Account number',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: Pallets.disabledIconColor,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Name of bank',
          label: 'Name of bank',
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Sort code',
          label: 'Sort code',
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Swift code (If any)',
          label: 'Swift code (If any)',
        ),
        SizedBox(
          height: 40,
        ),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Previous',
          color: Pallets.grey800,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          borderColor: Color(0xff3F3F46),
          primary: Pallets.white,
          onPressed: () => _tabViewModel.switchIndex(2),
        ),
        SizedBox(
          height: 24,
        ),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Save & start 14 days free trial',
          color: Pallets.white,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          primary: Pallets.orange600,
          onPressed: () => PageRouter.gotoNamed(Routes.welcome, context),
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
