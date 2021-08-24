import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

TextEditingController _dateController = TextEditingController();

void showPinModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(23),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Pallets.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 23),
                Center(
                  child: Container(
                    width: getDeviceWidth(context) / 5,
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                ),
                SizedBox(height: 23),
                TextView(
                  text: 'Enter transaction pin',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Pallets.grey900,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 23),
                EditFormField(
                  floatingLabel: '',
                  label: '',
                  onTapped: () => null,
                  controller: _dateController,
                ),
                SizedBox(height: 40),
                ButtonWidget(
                  width: getDeviceWidth(context),
                  buttonText: 'Make payment',
                  color: Pallets.white,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  fontStyle: FontStyle.normal,
                  primary: Pallets.orange500,
                  borderColor: Pallets.orange500,
                  onPressed: () {
                    PageRouter.goBack(context);
                  },
                ),
                SizedBox(height: 23)
              ],
            ),
          ),
        );
      });
}
