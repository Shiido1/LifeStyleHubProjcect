import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/provider/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/tabs/bank_information_widget.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/tabs/next_of_kin_information.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import 'tabs/basic_information.dart';
import 'tabs/work_information.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Consumer<TabViewModel>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
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
                            color: provider.isNextTab
                                ? Pallets.orange500
                                : Pallets.grey200,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    _switchTabs(provider)
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget _switchTabs(TabViewModel provider) {
    if (provider.index == 0) {
      return BasicInformationWidget();
    }
    if (provider.index == 1) {
      return NextOfKinInformationWidget();
    }
    if (provider.index == 3) {
      return BankInformationWidget();
    }

    return WorkInformationWidget();
  }
}
