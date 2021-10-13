import 'package:flutter/material.dart';
import 'viewmodel/information_viewmodel.dart';
import 'viewmodel/tab_viewmodel.dart';
import 'tabs/bank_information_widget.dart';
import 'tabs/next_of_kin_information.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/overlay.dart';
import '../../../utils/images.dart';
import '../../../utils/pallets.dart';
import 'package:provider/provider.dart';

import 'tabs/basic_information.dart';
import 'tabs/work_information.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<TabViewModel, InformationViewModel>(
      builder: (context, provider, info, child) {
        return LoadingOverlay(
          isLoading: info.loading,
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
                            color: provider.index! >= 1
                                ? Pallets.orange500
                                : Pallets.grey200,
                          ),
                        ),
                        SizedBox(width: 17),
                        Expanded(
                          child: Divider(
                            thickness: 4,
                            color: provider.index! >= 2
                                ? Pallets.orange500
                                : Pallets.grey200,
                          ),
                        ),
                        SizedBox(width: 17),
                        Expanded(
                          child: Divider(
                            thickness: 4,
                            color: provider.index! >= 3
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
            ),
          ),
        );
      },
    );
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
