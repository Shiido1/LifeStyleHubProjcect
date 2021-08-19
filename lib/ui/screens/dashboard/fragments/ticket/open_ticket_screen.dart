import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/viewmodel/ticket_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/modal.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class OpenTicketScreen extends StatefulWidget {
  const OpenTicketScreen({Key? key}) : super(key: key);

  @override
  _OpenTicketScreenState createState() => _OpenTicketScreenState();
}

class _OpenTicketScreenState extends State<OpenTicketScreen> {
  final _ticketNotifier = ChangeNotifierProvider((ref) => TicketViewmodel());

  TicketViewmodel? _ticketViewmodel;

  @override
  void initState() {
    _ticketViewmodel = context.read(_ticketNotifier);
    _ticketViewmodel!.init(context);
    _ticketViewmodel!.getAllTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Open a ticket',
          showLeadig: true,
          image:
              'https://images.unsplash.com/photo-1558185348-fe8fa4cf631f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
      body: Consumer(builder: (context, watch, child) {
        final _response = watch(_ticketNotifier);
        if (_response.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return LoadingOverlay(
          isLoading: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                EditFormField(
                    floatingLabel: 'Date',
                    label: 'Subject',
                    controller: null,
                    keyboardType: TextInputType.text),
                EditFormField(
                  floatingLabel: '',
                  label: 'Subject department',
                  controller: null,
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                  readOnly: true,
                  onTapped: () => showOpenedTicketModal(context, 'Select department',
                      ['Sales', 'Billing', 'Technical'],
                      onPress: (String? value) {}),
                  suffixIcon: Icons.keyboard_arrow_down,
                  suffixIconColor: Pallets.disabledIconColor,
                ),
                EditFormField(
                  floatingLabel: '',
                  label: 'Priority',
                  controller: null,
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                  readOnly: true,
                  onTapped: () => showOpenedTicketModal(
                      context, 'Select priority', ['Low', 'Medium', 'High'],
                      onPress: (String? value) {}),
                  suffixIcon: Icons.keyboard_arrow_down,
                  suffixIconColor: Pallets.disabledIconColor,
                ),
                SizedBox(height: 23),
                Container(
                  height: 229,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Pallets.grey100,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: null,
                    // ignore: missing_return
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                    },
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                    enabled: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: Pallets.orange500,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: 'Type your message here'),
                  ),
                ),
                SizedBox(height: 24),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Pallets.orange500,
                      ),
                      SizedBox(width: 10),
                      TextView(
                        text: 'Attach a file',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Pallets.orange500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        width: getDeviceWidth(context),
                        buttonText: 'Submit',
                        color: Pallets.white,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        primary: Pallets.orange600,
                        onPressed: () => null,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ButtonWidget(
                        width: getDeviceWidth(context),
                        buttonText: 'Cancel',
                        color: Pallets.black,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        primary: Pallets.grey400,
                        borderColor: Pallets.grey400,
                        onPressed: () => null,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 33),
              ],
            ),
          ),
        );
      }),
    );
  }
}
