import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/pallets.dart';
import '../../../../../helper/helper_handler.dart';
import 'viewmodel/marketting_viewmodel.dart';
import 'widget/banner_content_widget.dart';
import 'widget/post_content_widget.dart';
import 'widget/video_content_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'dao/marketting_dao.dart';
import 'model/get_resources_model.dart';
import 'widget/single_content_widget.dart';

class MarkettingScreen extends StatefulWidget {
  MarkettingScreen({Key? key}) : super(key: key);

  @override
  _MarkettingScreenState createState() => _MarkettingScreenState();
}

class _MarkettingScreenState extends State<MarkettingScreen> {
//   final _markettingViewModel =
//       ChangeNotifierProvider((ref) => MarkettingViewmodel());

  MarkettingViewmodel? _marketting;

  @override
  void initState() {
    _marketting = Provider.of<MarkettingViewmodel>(context, listen: false);
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
          return Consumer<MarkettingViewmodel>(
              builder: (context, watch, child) {
            // final _response = watch.watch(_markettingViewModel);
            if (watch.loading) {
              return Center(
                child: SpinKitCubeGrid(
                  color: Pallets.orange600,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmartRefresher(
                controller: _marketting!.refreshController,
                onRefresh: () => _marketting!.getMarketing(),
                child: ListView(
                  children: [
                    SingleContentWidget(markettingViewmodel: watch),
                    VideoContents(response: watch),
                    BannerContents(response: watch),
                    PostContents(response: watch),
                    SizedBox(height: getDeviceHeight(context) / 6)
                  ],
                ),
              ),
            );
          });
        });
  }
}
