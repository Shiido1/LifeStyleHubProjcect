import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/leadership/leadership/leadership_screen.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class LeadershipScreen extends StatefulWidget {
  const LeadershipScreen({Key? key}) : super(key: key);

  @override
  _LeadershipScreenState createState() => _LeadershipScreenState();
}

class _LeadershipScreenState extends State<LeadershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 100),
        child: Container(
          width: getDeviceWidth(context),
          child: Column(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(right: 50),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    leadershipWidget(
                        image: 'assets/svgs/senior_leadership_icon.svg',
                        text: 'Senior Leader',
                        screen: SeniorLeaderShipScreenPage(
                          title: 'Senior Leader',
                        )),
                    leadershipWidget(
                        image: 'assets/svgs/executive_leadership_icon.svg',
                        text: 'Executive Leader',
                        screen: SeniorLeaderShipScreenPage(
                          title: 'Executive Leader',
                        )),
                    leadershipWidget(
                        image: 'assets/svgs/rhodium_leader_icon.svg',
                        text: 'Rhodium Leader',
                        screen: SeniorLeaderShipScreenPage(
                          title: 'Rhodium Leader',
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                decoration: BoxDecoration(
                    color: Pallets.orange101,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextView(
                      text: 'Senior Leader',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Package name',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Pallets.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextView(
                              text: 'Package name',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Pallets.grey600,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextView(
                              text: 'Package name',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Pallets.grey600,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextView(
                              text: 'Date completed',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Pallets.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextView(
                              text: '08 June 2021',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Pallets.grey600,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextView(
                              text: '08 June 2021',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Pallets.grey600,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: Pallets.grey600,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Description',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Pallets.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextView(
                              text: 'Please activate my account',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Pallets.grey600,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextView(
                              text: 'Please activate my account',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Pallets.grey600,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextView(
                              text: 'Action',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Pallets.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextView(
                              text: 'View package',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Pallets.grey600,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextView(
                              text: 'View package',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Pallets.grey600,
                            ),
                          ],
                        ),
                      ],
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Status',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Pallets.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextView(
                          text: 'In progress',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Pallets.grey600,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextView(
                          text: 'Fulfilled',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Pallets.grey600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  leadershipWidget({String? image, String? text, required Widget screen}) =>
      GestureDetector(
        onTap: () => PageRouter.gotoWidget(screen, context),
        child: Container(
          width: getDeviceWidth(context) / 2 * 1.85,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Pallets.grey100,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageLoader(
                path: image!,
                height: 50,
                width: 50,
              ),
              SizedBox(
                height: 23,
              ),
              TextView(
                text: text!,
                fontSize: 18,
                fontWeight: FontWeight.w700,
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextView(
                          text: '30% complete',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Pallets.black,
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(bottom: 20, top: 20),
                            child: LinearProgressIndicator(
                              value: 0.4,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Pallets.orange600),
                              backgroundColor: Colors.grey,
                              minHeight: 8,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Pallets.orange600),
                              backgroundColor: Colors.grey,
                              minHeight: 8,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ButtonWidget(
                width: getDeviceWidth(context),
                buttonText: 'view details',
                color: Pallets.white,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                fontStyle: FontStyle.normal,
                primary: Pallets.orange600,
                onPressed: () => PageRouter.gotoWidget(screen, context),
              ),
            ],
          ),
        ),
      );
}
