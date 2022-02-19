import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/leadership/model/leadership_response_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class SeniorLeaderShipScreenPage extends StatefulWidget {
  const SeniorLeaderShipScreenPage(
      {Key? key, required this.title, required this.leadership})
      : super(key: key);
  final String title;
  final Leaderships leadership;

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
                  text: 'Overall progress ${widget.leadership.progress!.toString()}%',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Pallets.black,
                ),
                Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(bottom: 20, top: 20),
                    child: LinearProgressIndicator(
                      value: widget.leadership.progress!.toDouble()/100,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Pallets.orange600),
                      backgroundColor: Colors.grey,
                      minHeight: 8,
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                            text: widget.leadership.task!,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          TextView(
                            text: widget.leadership.requirements!.text!,
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
                          ...widget.leadership.reward!
                              .map((reward) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: reward,
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
                                    ],
                                  ))
                              .toList(),
                          SizedBox(
                            height: 18,
                          ),
                          TextView(
                            text:
                                '${widget.leadership.progress!.toString()} complete',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Pallets.black,
                          ),
                          Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(bottom: 20, top: 20),
                              child: LinearProgressIndicator(
                                value: widget.leadership.progress!.toDouble()/100,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Pallets.orange600),
                                backgroundColor: Colors.grey,
                                minHeight: 8,
                              )),
                          SizedBox(
                            width: 24,
                          ),
                        ]))
              ],
            ),
          ),
        ]));
  }
}
