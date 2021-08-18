import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/marketting_details_screen.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/viewmodel/marketting_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/widget/banner_content_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/widget/post_content_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/widget/video_content_widget.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/glass_container.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class MarkettingScreen extends StatefulWidget {
  MarkettingScreen({Key? key}) : super(key: key);

  @override
  _MarkettingScreenState createState() => _MarkettingScreenState();
}

class _MarkettingScreenState extends State<MarkettingScreen> {
  final _markettingViewModel =
      ChangeNotifierProvider((ref) => MarkettingViewmodel());

  MarkettingViewmodel? _marketting;

  @override
  void initState() {
    _marketting = context.read(_markettingViewModel);
    _marketting!.init(context);
    _marketting!.getMarketting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _response = watch(_markettingViewModel);
      return LoadingOverlay(
        isLoading: _response.loading,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                height: 266,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Pallets.black),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible: _response.getSingleContent() != null,
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
                                text: _response.getSingleContent() != null
                                    ? _response.getSingleContent().title!
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
                        child: GestureDetector(
                          onTap: () => PageRouter.gotoWidget(
                              MarkettingDetailScreen(), context),
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
                      ),
                    )
                  ],
                ),
              ),
              VideoContents(response: _response),
              BannerContents(response: _response),
              PostContents(response: _response),
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      );
    });
  }
}
