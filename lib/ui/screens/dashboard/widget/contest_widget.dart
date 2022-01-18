import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../helper/helper_handler.dart';
import '../../../../helper/routes/navigation.dart';
import '../fragments/contest/contest_details.dart';
import '../fragments/contest/model/view_contest_model.dart';
import '../../../widgets/image_loader.dart';
import '../../../widgets/text_views.dart';
import '../../../../utils/pallets.dart';

// ignore: must_be_immutable
class ContestWidget extends StatelessWidget {
  final ViewContestModel? contest;

  ContestWidget({Key? key, required this.contest}) : super(key: key);

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => PageRouter.gotoWidget(ContestDetails(contest), context),
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.all(15),
        width: getDeviceWidth(context) / 1.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Pallets.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ImageLoader(
                    path: contest!.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: getDeviceWidth(context) / 18,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 61,
                        width: 61,
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            color: Pallets.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: TextView(
                            text: getDateTime(contest!.enddate!).day.toString(),
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Pallets.black,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      TextView(
                        text: 'Days left',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Pallets.white,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextView(
              text: contest!.name ?? '',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Pallets.white,
              textAlign: TextAlign.left,
              maxLines: 1,
            ),
            SizedBox(
              height: 17,
            ),
            TextView(
              text: contest!.description ?? '',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Pallets.white,
              textAlign: TextAlign.left,
              maxLines: 2,
            ),
            SizedBox(
              height: 36.31,
            ),
            LinearProgressIndicator(
              backgroundColor: Pallets.grey600,
              valueColor: new AlwaysStoppedAnimation<Color>(Pallets.orange500),
              value: getPercentage(
                  directReferred: contest!.directsReferred ?? 0,
                  directRequired: contest!.directsRequired ?? 0),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextView(
                    text: 'See details',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Pallets.orange500,
                    textAlign: TextAlign.left,
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Pallets.orange500,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
