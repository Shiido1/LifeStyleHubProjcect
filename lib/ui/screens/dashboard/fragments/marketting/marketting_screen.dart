import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/viewmodel/marketting_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/widget/banner_content_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/widget/post_content_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/widget/video_content_widget.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';

import 'dao/marketting_dao.dart';
import 'model/get_resources_model.dart';
import 'widget/single_content_widget.dart';

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
    _marketting!.getMarketing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: markettingDao!.getListenable()!,
        builder: (_, Box<dynamic> box, __) {
          List<Data> _marketing = markettingDao!.convert(box);
          _marketting!.sortContentByType(_marketing);
          return Consumer(builder: (context, watch, child) {
            final _response = watch(_markettingViewModel);
            if (_response.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return LoadingOverlay(
              isLoading: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    SingleContentWidget(markettingViewmodel: _response),
                    VideoContents(response: _response),
                    BannerContents(response: _response),
                    PostContents(response: _response),
                    SizedBox(height: getDeviceHeight(context) / 6)
                  ],
                ),
              ),
            );
          });
        });
  }
}
