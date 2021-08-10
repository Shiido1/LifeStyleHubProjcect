import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/provider/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class BasicInformationWidget extends StatelessWidget {
  const BasicInformationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tabViewModel = Provider.of<TabViewModel>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Basic information',
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
              'This builds up your profile on Lifestyle Asset Hub, ease of login, and other operations',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Pallets.grey700,
          textAlign: TextAlign.left,
        ),
        SizedBox(
                height: 8,
        ),
        EditFormField(
          floatingLabel: 'Full name',
          label: 'Full name',
        ),
        SizedBox(
                height: 8,
        ),
        EditFormField(
          floatingLabel: 'Phone number',
          label: 'Phone number',
        ),
        SizedBox(
                height: 8,
        ),
        EditFormField(
          floatingLabel: 'State/province',
          label: 'Select state',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: Pallets.disabledIconColor,
        ),
        SizedBox(
                height: 8,
        ),
        EditFormField(
          floatingLabel: 'Address',
          label: 'Address',
        ),
        SizedBox(
                height: 8,
        ),
        EditFormField(
          floatingLabel: 'Sex',
          label: 'Select sex',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: Pallets.disabledIconColor,
        ),
        SizedBox(
                height: 8,
        ),
        EditFormField(
          floatingLabel: 'Date of Birth',
          label: 'Date of Birth',
          suffixIcon: Icons.calendar_today_outlined,
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
          onPressed: () => _tabViewModel.switchIndex(1),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
