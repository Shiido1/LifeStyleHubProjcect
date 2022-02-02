import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class SeniorLeaderShipScreenPage extends StatefulWidget {
  const SeniorLeaderShipScreenPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<SeniorLeaderShipScreenPage> createState() =>
      _SeniorLeaderShipScreenPageState();
}

class _SeniorLeaderShipScreenPageState
    extends State<SeniorLeaderShipScreenPage> {
  UsersProfileModel? usersProfileModel;

  void _getCatchedInfos() async {
    usersProfileModel = await profileDao?.convert();

    setState(() {});
  }

  @override
  void initState() {
    _getCatchedInfos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          centerTitle: true,
          title: widget.title,
          showLeadig: true,
          image: usersProfileModel?.profilePic ?? ''),
      body: Stack(children: [
        SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: 'Overall progress 60%',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Pallets.black,
              ),
              Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Pallets.orange600),
                    backgroundColor: Colors.grey,
                    minHeight: 8,
                  )),
              SizedBox(
                height: 20,
              ),
              bodyContainer(text: 'Solid Refuge Task'),
              bodyContainer(text: 'Extra Luxury Task'),
            ],
          ),
        ),
        ButtomCountDownWidget()
      ]),
    );
  }

  bodyContainer({String? text}) => Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          color: Pallets.orange101,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextView(
              text: text!,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 18,
            ),
            TextView(
              text: 'Qualify twice & Produce 2 first generation qualifiers ',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 15,
            ),
            TextView(
              text: 'Rewards',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 18,
            ),
            TextView(
              text: 'N1,000,000 Education Grant',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            TextView(
              text:
                  'All expenses paid Weekend Get Away for 1 at Inagbe Resort, Lagos',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            TextView(
              text: '€500 worth of Physical Gold',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            TextView(
              text: 'Comprehensive Health Insurance for 6months (Family of 4)',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            TextView(
              text: 'Leadership Award',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Pallets.grey600,
            ),
            SizedBox(
              height: 18,
            ),
            TextView(
              text: '60% complete',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Pallets.black,
            ),
            Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(bottom: 20, top: 20),
                child: LinearProgressIndicator(
                  value: 0.7,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Pallets.orange600),
                  backgroundColor: Colors.grey,
                  minHeight: 8,
                )),
            SizedBox(
              width: 24,
            ),
          ]));
}
