import 'package:flutter/material.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../widgets/bottom_count_down.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../../utils/pallets.dart';
import '../../../../../utils/validators.dart';

class CreateNewTransactionPINScreen extends StatefulWidget {
  const CreateNewTransactionPINScreen({Key? key}) : super(key: key);

  @override
  _CreateNewTransactionPINScreenState createState() =>
      _CreateNewTransactionPINScreenState();
}

class _CreateNewTransactionPINScreenState
    extends State<CreateNewTransactionPINScreen> {
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(
        context,
        title: 'Change password',
        showLeadig: true,
        centerTitle: true,
        showImage: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Form(
              key: _globalFormKey,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 23),
                      EditFormField(
                        floatingLabel: 'Enter new (4) digit Tranaction pin',
                        label: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        autoValidate: _autoValidate,
                        validator: Validators.validatePlainPassword()!,
                      ),
                      SizedBox(height: 23),
                      EditFormField(
                        floatingLabel: 'Re-enter new (4) digit Tranaction pin',
                        label: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        autoValidate: _autoValidate,
                        validator: Validators.validatePlainPassword()!,
                      ),
                      SizedBox(
                        height: 36.25,
                      ),
                      ButtonWidget(
                        width: getDeviceWidth(context),
                        buttonText: 'Save changes',
                        color: Pallets.white,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        primary: Pallets.orange600,
                        onPressed: () => null,
                      ),
                      SizedBox(
                        height: 23,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ButtomCountDownWidget()
          ],
        ),
      ),
    );
  }
}
