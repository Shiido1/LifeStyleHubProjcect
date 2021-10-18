import 'package:flutter/material.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

class HistoryValues {
  final String? name;
  final String? email;
  final String? date;
  final String? packageName;
  final String? referral;

  HistoryValues(
      {this.name, this.email, this.date, this.packageName, this.referral});
}

class HistroyCard extends StatelessWidget {
  final HistoryValues? historyValues;

  const HistroyCard({Key? key, required this.historyValues}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Pallets.orange50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Pallets.amber500,
                      child: TextView(
                          text: historyValues!.name![0],
                          fontSize: 24,
                          color: Pallets.grey700,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: historyValues!.name!,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Pallets.grey800,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          TextView(
                            text: historyValues!.email!,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Pallets.grey500,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    TextView(
                      text: historyValues!.date!,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey500,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextView(
                        text: historyValues!.packageName!,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Pallets.grey500,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextView(
                      text: 'Referred by',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Pallets.orange500,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 8),
                    TextView(
                      text: historyValues!.referral!,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey500,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            )),
        SizedBox(height: 24),
      ],
    );
  }
}
