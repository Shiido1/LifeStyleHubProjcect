import 'package:flutter/material.dart';
import '../profile/dao/profile_dao.dart';
import '../profile/model/users_profile_model.dart';
import '../../../../../helper/helper_handler.dart';
import 'model/view_contest_model.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';

import 'widget/contest_time_left_widget.dart';

class ContestDetails extends StatefulWidget {
  final ViewContestModel? contestModel;

  const ContestDetails(this.contestModel, {Key? key}) : super(key: key);

  @override
  _ContestDetailsState createState() => _ContestDetailsState(contestModel);
}

class _ContestDetailsState extends State<ContestDetails> {
  final ViewContestModel? contestModel;

  _ContestDetailsState(this.contestModel);

  @override
  void initState() {
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
          title: contestModel?.name ?? '',
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(23),
              decoration: BoxDecoration(
                  color: Pallets.orange50,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextView(
                    text: contestModel?.name ?? '',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallets.grey600,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextView(
                    text: contestModel?.description ?? '',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Pallets.grey600,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 23, vertical: 36),
                    decoration: BoxDecoration(
                        color: Pallets.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: ImageLoader(
                      path: contestModel!.image,
                      height: 70,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 23, vertical: 46),
                    decoration: BoxDecoration(
                        color: Pallets.orange50,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        children: [
                          TextView(
                            text: '${contestModel?.directsReferred ?? 0}',
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                            color: Pallets.black,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextView(
                            text: 'Directs referred',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Pallets.grey500,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 36,
            ),
            TextView(
              text: 'Contest count down to finish',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Pallets.grey800,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContestTimeLeftWidget(
                  height: 96,
                  timeLeft: 'Days left',
                  textColor: Pallets.black,
                  timeColor: Pallets.black,
                  bgColor: Pallets.grey200,
                  directs: getDateTime(contestModel!.enddate!).day!.isNegative
                      ? 0
                      : getDateTime(contestModel!.enddate!).day,
                ),
                SizedBox(
                  width: 30,
                ),
                ContestTimeLeftWidget(
                  height: 96,
                  textColor: Pallets.black,
                  timeColor: Pallets.black,
                  bgColor: Pallets.grey200,
                  timeLeft: 'Hrs left',
                  directs: getDateTime(contestModel!.enddate!).day!.isNegative
                      ? 0
                      : getDateTime(contestModel!.enddate!).hour,
                ),
                SizedBox(
                  width: 30,
                ),
                ContestTimeLeftWidget(
                  height: 96,
                  textColor: Pallets.red600,
                  timeColor: Pallets.red600,
                  bgColor: Pallets.grey200,
                  timeLeft: 'Mins left',
                  directs: getDateTime(contestModel!.enddate!).day!.isNegative
                      ? 0
                      : getDateTime(contestModel!.enddate!).miniute,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Details of contest',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Pallets.grey800,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Pallets.green600,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextView(
                      text: 'In process',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Pallets.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(23),
              decoration: BoxDecoration(
                  color: Pallets.orange50,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Reward',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey800,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextView(
                    text: contestModel?.reward ?? '',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Pallets.grey500,
                  ),
                  SizedBox(
                    height: 23,
                  ),

                  /// ==========================

                  TextView(
                    text: 'Start date',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey800,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextView(
                    text: fomartCompleteDate(contestModel!.startdate!),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Pallets.grey500,
                  ),

                  /// ==========================

                  SizedBox(
                    height: 23,
                  ),
                  TextView(
                    text: 'Required direct',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey800,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextView(
                    text: '${contestModel?.directsRequired ?? 0}',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Pallets.grey500,
                  ),

                  /// ==========================

                  SizedBox(
                    height: 23,
                  ),

                  TextView(
                    text: 'Directs referred',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey800,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextView(
                    text: '${contestModel?.directsReferred ?? 0}',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Pallets.grey500,
                  ),

                  /// ==========================

                  SizedBox(
                    height: 23,
                  ),

                  TextView(
                    text: 'End date',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey800,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextView(
                    text: fomartCompleteDate(contestModel!.enddate!),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Pallets.grey500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
