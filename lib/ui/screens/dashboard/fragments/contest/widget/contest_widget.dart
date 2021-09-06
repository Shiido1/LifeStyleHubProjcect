import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/contest/model/view_contest_model.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import '../contest_details.dart';
import 'contest_time_left_widget.dart';

class ContestWidget extends StatelessWidget {
  final ViewContestModel? contest;

  const ContestWidget({Key? key, required this.contest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => PageRouter.gotoWidget(ContestDetails(contest), context),
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        padding: EdgeInsets.all(23),
        decoration: BoxDecoration(
            color: Pallets.black, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ImageLoader(
                    path: contest!.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: contest!.name ?? '',
                        color: Pallets.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8),
                      TextView(
                        text: contest!.description ?? '',
                        color: Pallets.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                ContestTimeLeftWidget(
                  timeLeft: 'Days left',
                  directs: getDateTime(contest!.enddate!).inDays,
                ),
                Spacer(),
                ContestTimeLeftWidget(
                  timeLeft: 'Hrs left',
                  directs: getDateTime(contest!.enddate!).inHours,
                ),
                Spacer(),
                ContestTimeLeftWidget(
                  timeLeft: 'Mins left',
                  directs: getDateTime(contest!.enddate!).inMinutes,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            LinearProgressIndicator(
              backgroundColor: Pallets.grey600,
              valueColor: new AlwaysStoppedAnimation<Color>(Pallets.orange500),
              value: getPercentage(
                  directReferred: contest!.directsReferred ?? 0,
                  directRequired: contest!.directsRequired ?? 0),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                TextView(
                  text: 'See details',
                  color: Pallets.orange600,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Pallets.orange600,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
