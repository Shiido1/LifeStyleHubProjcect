import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../helper/routes/navigation.dart';
import '../data/enum.dart';
import '../viewmodel/marketting_viewmodel.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../../widgets/glass_container.dart';
import '../../../../../widgets/image_loader.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

import '../marketting_details_screen.dart';

class SingleContentWidget extends StatelessWidget {
  final MarkettingViewmodel? markettingViewmodel;

  const SingleContentWidget({Key? key, required this.markettingViewmodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (markettingViewmodel!.getSingleContent() == null) {
      return Container();
    }
    return GestureDetector(
      onTap: () => PageRouter.gotoWidget(
          MarkettingDetailScreen(
            getResourcesModel: markettingViewmodel!.getSingleContent(),
            type: MarketingType.Video,
          ),
          context),
      child: Container(
        height: 266,
        child: Stack(
          children: [
            ImageLoader(
              path: markettingViewmodel!.getSingleContent().featuredImage!,
              fit: BoxFit.cover,
              isCurvedEdge: true,
              radius: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: markettingViewmodel!.getSingleContent() != null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ButtonWidget(
                        buttonText: 'VIDEO',
                        color: Pallets.white,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        borderColor: Pallets.orange500,
                        primary: Pallets.orange500,
                        onPressed: () => null,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextView(
                        text: markettingViewmodel!.getSingleContent() != null
                            ? markettingViewmodel!.getSingleContent().title!
                            : '',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Pallets.white,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GlassContainer(
                blur: 10,
                shadowStrength: 10,
                height: 56,
                opacity: 0.3,
                width: getDeviceWidth(context),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                border: Border.fromBorderSide(BorderSide.none),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(
                      text: 'Watch now',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Pallets.white,
                      textAlign: TextAlign.left,
                      onTap: () => null,
                    ),
                    Icon(
                      Icons.play_arrow,
                      color: Pallets.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
