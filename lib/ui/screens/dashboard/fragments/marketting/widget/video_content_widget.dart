import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/data/enum.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/viewmodel/marketting_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:page_transition/page_transition.dart';

import '../marketting_details_screen.dart';

class VideoContents extends StatelessWidget {
  final MarkettingViewmodel response;

  const VideoContents({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: response.videoContents.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          ViewAllButton(
            title: 'Videos',
            viewAll: () {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: response.videoContents
                  .map(
                    (element) => Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          ImageLoader(
                              width: 218,
                              height: 127,
                              onTap: () => PageRouter.gotoWidget(
                                    MarkettingDetailScreen(
                                      getResourcesModel: element,
                                      type: MarketingType.Video,
                                    ),
                                    context,
                                    animationType: PageTransitionType.fade,
                                  ),
                              path: element.featuredImage!),
                          SizedBox(height: 8),
                          Text(element.title!)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
