import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/modal.dart';
import '../../../../widgets/overlay.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';
import '../../../../../utils/validators.dart';

import 'enum/message_enum.dart';
import 'viewmodel/messaging_viewmodel.dart';

class CreateMessageScreen extends StatefulWidget {
  final MessageEnum? messageEnum;

  const CreateMessageScreen({Key? key, required this.messageEnum})
      : super(key: key);

  @override
  _CreateMessageScreenState createState() =>
      _CreateMessageScreenState(messageEnum);
}

class _CreateMessageScreenState extends State<CreateMessageScreen> {
  MessageEnum? messageEnum;
  _CreateMessageScreenState(this.messageEnum);

  final TextEditingController _controller = TextEditingController();
  bool _autoValidate = false;
  var _globalFormKey = GlobalKey<FormState>();

  final _messageViewModel =
      ChangeNotifierProvider((ref) => MessagingViewmodel());

  MessagingViewmodel? _messagingViewmodel;

  @override
  void initState() {
    _messagingViewmodel = context.read(_messageViewModel);
    _messagingViewmodel!.init(context);
    _getCatchedInfos();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getCustomAppBar(context,
            title: 'Messages',
            showLeadig: true,
            centerTitle: true,
            image: _profileModel?.profilePic ?? '',
            initial: _profileModel?.name ?? 'LH'),
        body: Consumer(
          builder: (context, watch, child) {
            final _provider = watch(_messageViewModel);
            return Form(
              key: _globalFormKey,
              child: LoadingOverlay(
                isLoading: _provider.loading,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      EditFormField(
                        floatingLabel: '',
                        label: 'Enter phone number or email address',
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        autoValidate: _autoValidate,
                        // validator: Validators.validateString(),
                      ),
                      SizedBox(height: 33),
                      ButtonWidget(
                        width: getDeviceWidth(context),
                        buttonText: 'Start chat',
                        color: Pallets.white,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        primary: Pallets.orange600,
                        onPressed: () => _validate(),
                      ),
                      SizedBox(height: 33),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  void _validate() {
    switch (messageEnum) {
      case MessageEnum.broadcast:
        break;
      case MessageEnum.single:
        _sendSingleMessage();
        break;
      default:
    }
  }

  void _sendSingleMessage() {
    FocusScope.of(context).unfocus();
    _messagingViewmodel!.createConversation(_controller.text);

    if (_globalFormKey.currentState!.validate()) {
    } else {
      setState(() => _autoValidate = true);
    }
  }
}
