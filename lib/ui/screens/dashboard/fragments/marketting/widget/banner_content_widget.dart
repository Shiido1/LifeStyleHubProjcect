import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/data/enum.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/viewmodel/marketting_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';

import '../marketting_details_screen.dart';
import '../view_all_marketting_tools_screen.dart';

class BannerContents extends StatelessWidget {
  final MarkettingViewmodel response;

  const BannerContents({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: response.bannerContents.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          ViewAllButton(
            title: 'Social media banners',
            viewAll: () => PageRouter.gotoWidget(
                ViewAllMarkettingScreen(marketingType: MarketingType.Banner),
                context),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: response.bannerContents
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
                                    type: MarketingType.Banner,
                                  ),
                                  context),
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
