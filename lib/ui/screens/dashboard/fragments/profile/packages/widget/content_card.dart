import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class ContentCard extends StatelessWidget {
  final dynamic element;
  final Function()? onTap;

  const ContentCard(this.element, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Pallets.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.5, vertical: 9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Pallets.grey50,
                  border: Border.all(color: Pallets.grey200)),
              child: TextView(
                text: element?.type ?? '',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Pallets.orange500,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              element?.image == null
                  ? Container(
                      height: 56,
                      width: 56,
                    )
                  : ImageLoader(
                      height: 56,
                      width: 56,
                      path: element?.image ?? '',
                    ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextView(
                      text: element?.name ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Pallets.grey900,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    TextView(
                      text: '\$${element?.value ?? 0}',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Pallets.grey400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Pallets.orange600,
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextView(
                  text: element?.subscription ?? '',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Pallets.grey800,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Pallets.orange600,
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextView(
                  text: element?.description ?? '',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Pallets.grey800,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          SizedBox(height: 24),
          ButtonWidget(
            width: getDeviceWidth(context),
            buttonText: 'Subscribe now',
            color: Pallets.white,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            fontStyle: FontStyle.normal,
            primary: Pallets.orange600,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
