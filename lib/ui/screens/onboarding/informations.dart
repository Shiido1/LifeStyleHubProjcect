import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/information_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/tabs/bank_information_widget.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/tabs/next_of_kin_information.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'tabs/basic_information.dart';
import 'tabs/work_information.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  int _tabIndex = 0;

  InformationViewModel? _informationModel;

  final _inforProvider =
      ChangeNotifierProvider((ref) => InformationViewModel());

  @override
  void initState() {
    _informationModel = context.read(_inforProvider);
    _informationModel!.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final _info = watch(_inforProvider);
        return LoadingOverlay(
          isLoading: _info.loading,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageLoader(
                      path: AppImages.logo,
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 4,
                            color: Pallets.orange500,
                          ),
                        ),
                        SizedBox(width: 17),
                        Expanded(
                          child: Divider(
                            thickness: 4,
                            color: _tabIndex >= 1
                                ? Pallets.orange500
                                : Pallets.grey200,
                          ),
                        ),
                        SizedBox(width: 17),
                        Expanded(
                          child: Divider(
                            thickness: 4,
                            color: _tabIndex >= 2
                                ? Pallets.orange500
                                : Pallets.grey200,
                          ),
                        ),
                        SizedBox(width: 17),
                        Expanded(
                          child: Divider(
                            thickness: 4,
                            color: _tabIndex >= 3
                                ? Pallets.orange500
                                : Pallets.grey200,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    _switchTabs()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _switchTabs() {
    if (_tabIndex == 0) {
      return BasicInformationWidget(
        index: (int value) => setState(() => _tabIndex = value),
      );
    }
    if (_tabIndex == 1) {
      return NextOfKinInformationWidget(
          index: (value) => setState(() => _tabIndex = value));
    }
    if (_tabIndex == 3) {
      return BankInformationWidget(
          index: (value) => setState(() => _tabIndex = value));
    }
    return WorkInformationWidget(
        index: (value) => setState(() => _tabIndex = value));
  }
}
