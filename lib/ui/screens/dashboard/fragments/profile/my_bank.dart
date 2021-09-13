import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/add_bank_screen.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/dao/account_dao.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/model/get_bank_account_model.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/viewmodel/account_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/general_bottom_sheet.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:page_transition/page_transition.dart';
import 'model/users_profile_model.dart';

import 'viewmodel/profile_viewmodel.dart';

class BankListScreen extends StatefulWidget {
  const BankListScreen({Key? key}) : super(key: key);

  @override
  _BankListScreenState createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  final _accountProvider =
      ChangeNotifierProvider((_) => BankAccountViewmodel());
  BankAccountViewmodel? _accountViewmodel;

  final List<String> _optionsList = ['Edit details', 'Delete bank'];

  @override
  void initState() {
    _accountViewmodel = context.read(_accountProvider);
    _accountViewmodel!.init(context);
    _accountViewmodel!.getBankAccounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: accountDao!.getListenable()!,
      builder: (BuildContext context, dynamic value, Widget? child) {
        List<GetBankAccountModel> _bankList =
            accountDao!.convert(value).toList();
        return Scaffold(
            appBar: getCustomAppBar(
              context,
              title: 'My banks',
              showLeadig: true,
              showImage: false,
              centerTitle: true,
            ),
            body: Consumer(builder: (_, watch, __) {
              final _accountWatcher = watch(_accountProvider);
              if (_accountWatcher.loading) {
                return Center(child: CircularProgressIndicator());
              }
              return SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        children: _bankList
                            .map((bank) => Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 24),
                                  decoration: BoxDecoration(
                                      color: Pallets.orange50,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextView(
                                              text: bank.name ?? '',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Pallets.grey800,
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 8),
                                            TextView(
                                              text:
                                                  '${bank.accountName ?? ''} ${bank.accountNo ?? ''}',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Pallets.grey500,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () => showGeneralSheet(
                                                  context,
                                                  'Select action',
                                                  _optionsList,
                                                  onPress: (value) {
                                                PageRouter.goBack(context);

                                                if (value == _optionsList.first)
                                                  PageRouter.gotoWidget(
                                                      AddOrEditBankAccountScreen(
                                                          bank: bank),
                                                      context,
                                                      animationType:
                                                          PageTransitionType
                                                              .fade);
                                                else
                                                  logger.d(value);
                                              }),
                                          icon: Icon(Icons.more_vert))
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ButtonWidget(
                              width: getDeviceWidth(context),
                              buttonText: 'Add new bank',
                              color: Pallets.white,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              fontStyle: FontStyle.normal,
                              primary: Pallets.orange600,
                              onPressed: () => PageRouter.gotoWidget(
                                  AddOrEditBankAccountScreen(), context,
                                  animationType: PageTransitionType.fade),
                            ),
                          ),
                          ButtomCountDownWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
      },
    );
  }
}