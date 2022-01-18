import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../helper/routes/navigation.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../../widgets/custom_dialog_menu_pop.dart';
import '../../../../../widgets/date_picker.dart';
import '../../../../../widgets/edit_form_widget.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

int? _value = 0;
List<String> _valueList = [
  'Open tickets',
  'Closed tickets',
  'Replied',
  'Answered ticket',
];

TextEditingController _dateController = TextEditingController();

class Filter {
  final String? status;
  final String? date;
  final String? priority;

  Filter({this.status, this.date, this.priority});
}

void showTicketFiltering(BuildContext context,
    {required Function(Filter filter) callBack}) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Filter',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Pallets.grey500,
                      textAlign: TextAlign.left,
                    ),
                    IconButton(
                        onPressed: () => PageRouter.goBack(context),
                        icon: Icon(
                          Icons.clear,
                          color: Pallets.grey500,
                        ))
                  ],
                ),
                SizedBox(height: 36),
                TextView(
                  text: 'Status',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Pallets.grey400,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                Wrap(
                  children: List<Widget>.generate(
                    _valueList.length,
                    (int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 16),
                        child: ChoiceChip(
                          side: BorderSide(
                              width: 0.5,
                              color: _value == index
                                  ? Pallets.orange500
                                  : Pallets.grey800),
                          backgroundColor: Pallets.white,
                          label: Text(
                            _valueList[index],
                            style: TextStyle(
                                color: _value == index
                                    ? Pallets.white
                                    : Pallets.grey500),
                          ),
                          selectedColor: Pallets.orange500,
                          selected: _value == index,
                          onSelected: (bool selected) {
                            // _value = selected ? index : null;
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(height: 40),
                EditFormField(
                  floatingLabel: 'Date',
                  label: 'Date',
                  suffixIcon: Icons.calendar_today_outlined,
                  suffixIconColor: Pallets.disabledIconColor,
                  readOnly: true,
                  onTapped: () =>
                      pickDate(context: context, onChange: (String date) {}),
                  controller: _dateController,
                ),
                SizedBox(height: 23),
                EditFormField(
                  floatingLabel: 'Priority ',
                  label: 'Select priority ',
                  suffixIcon: Icons.keyboard_arrow_down,
                  suffixIconColor: Pallets.disabledIconColor,
                  readOnly: true,
                  onTapped: () => showCustomDialog(context,
                      title: 'Priority',
                      items: ['High', 'Medium', 'Low'],
                      onTap: (value) {}),
                  controller: _dateController,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        width: getDeviceWidth(context),
                        buttonText: 'Reset',
                        color: Pallets.white,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        borderColor: Pallets.black,
                        primary: Pallets.black,
                        onPressed: () => null,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ButtonWidget(
                        width: getDeviceWidth(context),
                        buttonText: 'Apply',
                        color: Pallets.white,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        primary: Pallets.orange500,
                        borderColor: Pallets.orange500,
                        onPressed: () {
                          callBack(Filter(
                              status: 'Status',
                              date: 'Date',
                              priority: 'High'));
                          PageRouter.goBack(context);
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 33),
              ],
            ),
          ),
        );
      });
}
