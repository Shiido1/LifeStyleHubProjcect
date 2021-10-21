import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';

import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class MemberCardModel {
  final String? name;
  final String? phoneNo;
  final String? date;
  final int? money;

  MemberCardModel({this.name, this.phoneNo, this.date, this.money});
}

class MemberCard extends StatelessWidget {
  final MemberCardModel? element;
  const MemberCard({Key? key, required this.element}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 23),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Pallets.orange50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextView(
                  text: element!.name ?? 'N/A',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                  fontSize: 14,
                  color: Pallets.grey700,
                  maxLines: 1,
                ),
              ),
              TextView(
                text: formatCurrency(element!.money ?? 0),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.right,
                fontSize: 14,
                color: Pallets.grey700,
                maxLines: 1,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextView(
                  text: element!.phoneNo ?? 'N/A',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                  fontSize: 14,
                  color: Pallets.grey700,
                  maxLines: 1,
                ),
              ),
              TextView(
                text: 'Direct referral',
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.right,
                fontSize: 14,
                color: Pallets.grey700,
                maxLines: 1,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextView(
                  text: '',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                  fontSize: 14,
                  color: Pallets.grey700,
                  maxLines: 1,
                ),
              ),
              TextView(
                text: fomartDate(element!.date!),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.right,
                fontSize: 14,
                color: Pallets.orange500,
                maxLines: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
