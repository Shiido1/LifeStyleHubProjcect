import 'package:flutter/material.dart';
import '../../../widgets/text_views.dart';
import '../../../../utils/pallets.dart';

class ViewAllButton extends StatelessWidget {
  final String? title;
  final Function()? viewAll;
  const ViewAllButton({Key? key, required this.title, required this.viewAll})
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
          color: Pallets.grey500,
          textAlign: TextAlign.left,
        ),
        TextView(
          onTap: viewAll,
          text: 'View all',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Pallets.grey500,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
