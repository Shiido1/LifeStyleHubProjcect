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
  const VppTeamCardWidget(
      {Key? key,
        required this.name,
        required this.email,
        required this.bgColor,
        required this.signUpCount,
        required this.date}) : super(key: key);

  String? splitName(String? name){
    if(name==null || name.isEmpty)
      return '';
    List<String> list = name.split(' ');
    return '${list[0][0].toUpperCase()}${list[1][0].toUpperCase()}';
  }

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
                    text:splitName(name) ?? '',
                    fontSize: 24,
                    color: Pallets.black,
                  ),
                ),
              ),
                SizedBox(width:12),
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
                  TextView(
                    text: email ?? '',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.disabledIconColor,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                  icon:Icon(Icons.more_horiz_outlined,color: Pallets.grey200,),
                  onPressed:(){}
              )
            ],
          ),
              Divider(thickness:1,color:Pallets.grey100),
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
                      color: Pallets.orange00,
                      textAlign: TextAlign.left,
                    ),TextView(
                      text: signUpCount.toString(),
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
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Pallets.disabledIconColor,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          )
            ],
      ),
    );
  }
}
