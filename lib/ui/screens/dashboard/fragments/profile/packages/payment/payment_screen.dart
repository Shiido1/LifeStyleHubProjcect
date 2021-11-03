import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../../helper/helper_handler.dart';
import '../../dao/profile_dao.dart';
import '../../model/users_profile_model.dart';
import '../viewmodel/package_viewmodel.dart';
import '../../../../../../widgets/buttons.dart';
import '../../../../../../widgets/custom_appbar.dart';
import '../../../../../../widgets/text_views.dart';
import '../../../../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

import 'modal/payment_modal.dart';

class PaymentScreen extends StatefulWidget {
  final dynamic element;
  const PaymentScreen(this.element, {Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PackageViewmodel? _packageViewmodel;

  @override
  void initState() {
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel!.init(context);
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
          title: 'Payment Options',
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextView(
              text: 'Package details',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Pallets.grey800,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16),
            TextView(
              text: 'Choose how to you want to grow in our network with ease',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Pallets.grey700,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 24),
            TextView(
              text: 'Package Summary',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Pallets.grey800,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(23),
              decoration: BoxDecoration(
                  color: Pallets.orange50,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextView(
                          text: widget.element?.name ?? '',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Pallets.grey800,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: TextView(
                          text: '\$${widget.element?.value ?? 0}',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Pallets.grey800,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextView(
                          text: widget.element?.subscription ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: TextView(
                          text: 'Amount due',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Pallets.orange500,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextView(
                          text: 'Total amount due',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: TextView(
                          text: '\$${widget.element?.value ?? 0}',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Pallets.grey700,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  ButtonWidget(
                    width: getDeviceWidth(context),
                    buttonText: 'Subscribe now',
                    color: Pallets.white,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontStyle: FontStyle.normal,
                    primary: Pallets.orange600,
                    onPressed: () {
                      final _payment =
                          Provider.of<PackageViewmodel>(context, listen: false);
                      _payment.init(context);
                      showPayment(context, widget.element.id, _payment);
                    },
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
