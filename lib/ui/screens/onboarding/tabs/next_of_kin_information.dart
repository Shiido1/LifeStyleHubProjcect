import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/provider/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class NextOfKinInformationWidget extends StatelessWidget {
  const NextOfKinInformationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tabViewModel = Provider.of<TabViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Next of Kin Information',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Pallets.grey800,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Next of kin full name',
          label: 'Next of kin full name',
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Relationship',
          label: 'Select relationship',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: Pallets.disabledIconColor,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Next of kin phone number',
          label: 'Phone number',
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Email address',
          label: 'Email address',
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
          onPressed: () => _tabViewModel.switchIndex(0),
        ),
        SizedBox(
          height: 24,
        ),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Next',
          color: Pallets.white,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          primary: Pallets.orange600,
          onPressed: () => _tabViewModel.switchIndex(2),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
