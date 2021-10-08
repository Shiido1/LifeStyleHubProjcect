import 'package:flutter/material.dart';
import '../../../widgets/text_views.dart';
import '../../../../utils/pallets.dart';

class ViewAllButton extends StatelessWidget {
  final String? title;
  bool showViewAll;
  final Function()? viewAll;
  ViewAllButton(
      {Key? key,
      required this.title,
      required this.viewAll,
      this.showViewAll = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          text: title!,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Pallets.grey800,
          textAlign: TextAlign.left,
        ),
        Visibility(
          visible: showViewAll,
          child: TextView(
            onTap: viewAll,
            text: 'View all',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Pallets.grey500,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
