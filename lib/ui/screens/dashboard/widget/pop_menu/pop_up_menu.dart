import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'custom_pop_menu.dart';
import 'items.dart';

final CustomPopupMenuController controller = CustomPopupMenuController();


// ignore: must_be_immutable
class PopMenuWidget extends StatelessWidget {
  List<PostsMenuModel>? menuItems;
  Function(PopMenuOptions)? menuCallback;

  PopMenuWidget({Key? key, @required this.menuItems, this.menuCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.all(10),
        child:  Icon(
          Icons.more_horiz,
          color: Pallets.grey500,
        ),
      ),
      menuBuilder: () => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: menuItems!
                  .map(
                    (item) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => menuCallback!(item.options!),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: TextView(
                          text: item.title ?? '',
                          color: item.error! ? Pallets.red500 : Pallets.black,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      pressType: PressType.singleClick,
      verticalMargin: -10,
      controller: controller,
    );
  }
}
