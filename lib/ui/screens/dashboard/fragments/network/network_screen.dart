import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/second_icon.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'model/generation_model.dart';
import 'widget/matrix_widget.dart';

class NetworkScreen extends StatelessWidget {
  NetworkScreen({Key? key}) : super(key: key);

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
            text: 'The Elite VVIP ',
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
            text: 'Extra Luxury Packages',
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
            label: 'The Elite VVIP',
            controller: null,
            keyboardType: TextInputType.text,
            onChange: (value) {},
            readOnly: true,
            onTapped: () => null,
            suffixIcon: Icons.keyboard_arrow_down,
            suffixIconColor: Pallets.disabledIconColor,
          ),
          SizedBox(
            height: 36,
          ),
          MatrixDisplayWidget(me: Me.getMyDescendants()),
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
