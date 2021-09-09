import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../../helper/configs/instances.dart';
import '../../../../../helper/helper_handler.dart';
import 'dao/contest_dao.dart';
import 'model/view_contest_model.dart';
import 'viewmodel/contest_viewmodel.dart';
import 'widget/contest_widget.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widget/contest_time_left_widget.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({Key? key}) : super(key: key);

  @override
  _ContestScreenState createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  final _contestProvider = ChangeNotifierProvider((_) => ContestViewModel());
  ContestViewModel? _contestViewModel;

  @override
  void initState() {
    _contestViewModel = context.read(_contestProvider);
    _contestViewModel!.init(context);
    _contestViewModel!.getListContest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: contestDao!.getListenable()!,
        builder: (_, Box<dynamic> box, __) {
          List<ViewContestModel> _contestList =
              contestDao!.convert(box).toList();
          return Consumer(builder: (_, watch, __) {
            final _contestWatch = watch(_contestProvider);
            return SmartRefresher(
              controller: _contestWatch.refreshController,
              onRefresh: () => _contestViewModel!.getListContest(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: _contestList
                      .map((contest) => ContestWidget(contest: contest))
                      .toList(),
                ),
              ),
            );
          });
        });
  }
}
