import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

// ignore: must_be_immutable
class ContestWidget extends StatelessWidget {
  final String? title;
  int? percent;

  ContestWidget({Key? key, required this.title, required this.percent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Image.asset('assets/images/gold.png'),
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
                          text: percent!.toString(),
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
            text: title!,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Pallets.white,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 17,
          ),
          TextView(
            text: 'Qualify for all expense paid to Bahamas Cruise',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Pallets.white,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 36.31,
          ),
          LinearProgressIndicator(
            backgroundColor: Pallets.grey600,
            valueColor: new AlwaysStoppedAnimation<Color>(Pallets.orange500),
            value: 20 / 100,
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
    );
  }
}
