import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/utils/images.dart';
import '../../../../../../../helper/routes/navigation.dart';
import '../../dao/profile_dao.dart';
import '../../model/users_profile_model.dart';
import 'bank_payment_screen.dart';
import '../../../../../../widgets/custom_appbar.dart';
import '../../../../../../widgets/text_views.dart';
import '../../../../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

import '../viewmodel/package_viewmodel.dart';

class LSHBankScreen extends StatefulWidget {
  const LSHBankScreen({Key? key}) : super(key: key);

  @override
  _LSHBankScreenState createState() => _LSHBankScreenState();
}

class _LSHBankScreenState extends State<LSHBankScreen> {
  PackageViewmodel? _packageViewmodel;

  @override
  void initState() {
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel!.init(context);
    _packageViewmodel!.getLSHBankz();
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
          title: 'Bank Payment',
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextView(
            text: 'List of Banks',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Pallets.grey800,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8),
          TextView(
            text: 'Select your preferred bank to make payment',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Pallets.grey700,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 32),
          Consumer<PackageViewmodel>(builder: (_, provider, __) {
            if (provider.loading) {
              return Center(
                  child: SpinKitCubeGrid(
                color: Pallets.orange600,
                size: 50,
              ));
            }
            return Expanded(
              child: ListView(
                children: [
                  ...provider.list!
                      .map((e) => InkWell(
                            onTap: () => PageRouter.gotoWidget(
                                BankPaymentScreen(
                                  id: e.id,
                                  bankName: e.name,
                                  accountName: e.accountName,
                                  accountNumber: e.accountNo,
                                ),
                                context),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Pallets.grey200)),
                              margin: EdgeInsets.only(bottom: 23),
                              child: Row(
                                children: [
                                  ImageLoader(path: AppImages.bank),
                                  SizedBox(width: 23),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: e.name ?? '',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Pallets.grey900,
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                        ),
                                        TextView(
                                          text:
                                              'Account name: ${e.accountName ?? 'N/A'}',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Pallets.grey700,
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                        ),
                                        TextView(
                                          text:
                                              'Account Number: ${e.accountNo ?? 'N/A'}',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Pallets.grey700,
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList()
                ],
              ),
            );
          })
        ]),
      ),
    );
  }
}
