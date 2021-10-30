import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class VppTeamCardWidget extends StatelessWidget {
  final String? name;
  final String? email;
  final Color? bgColor;
  final int? signUpCount;
  final String? date;
  final Widget? menu;

  const VppTeamCardWidget(
      {Key? key,
      required this.name,
      required this.email,
      required this.bgColor,
      required this.signUpCount,
      required this.date,
      required this.menu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(18),
      decoration:
          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Pallets.orange300),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextView(
                    text: name?[0].toUpperCase() ?? '',
                    fontSize: 24,
                    color: Pallets.black,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextView(
                    text: name ?? '',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey800,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 4),
                  TextView(
                    text: email ?? '',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.grey500,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Spacer(),
              menu!
            ],
          ),
          SizedBox(height: 17),
          Divider(thickness: 1, color: Color(0xffFFEDD5)),
          SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextView(
                    text: 'Sign Up count: ',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.orange500,
                    textAlign: TextAlign.left,
                  ),
                  TextView(
                    text: '${signUpCount ?? 0}',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey500,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Expanded(
                child: TextView(
                  text: fomartDate(date!),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Pallets.grey500,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
