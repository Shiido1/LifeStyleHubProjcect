import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/viewmodel/marketting_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import '../marketting_details_screen.dart';


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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: 'Social media banners',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Pallets.grey500,
                textAlign: TextAlign.left,
              ),
              TextView(
                onTap: () {},
                text: 'View all',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Pallets.grey500,
                textAlign: TextAlign.left,
              ),
            ],
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
                                  getResourcesModel: element),
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
