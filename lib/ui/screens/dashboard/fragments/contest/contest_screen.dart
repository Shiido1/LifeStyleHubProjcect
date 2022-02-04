import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'dao/contest_dao.dart';
import 'model/view_contest_model.dart';
import 'viewmodel/contest_viewmodel.dart';
import 'widget/contest_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({Key? key}) : super(key: key);

  @override
  _ContestScreenState createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  // final _contestProvider = ChangeNotifierProvider((_) => ContestViewModel());
  ContestViewModel? _contestViewModel;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _contestViewModel = Provider.of<ContestViewModel>(context, listen: false);
    _contestViewModel!.init(context);
    _contestViewModel!.getListContest();
    _refreshController.refreshCompleted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: contestDao!.getListenable()!,
        builder: (BuildContext context,
            AsyncSnapshot<ValueListenable<Box>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) return Container();
          return ValueListenableBuilder(
              valueListenable: snapshot.data!,
              builder: (_, Box<dynamic> box, __) {
                List<ViewContestModel> _contestList =
                    contestDao!.convert(box).toList();
                return Consumer<ContestViewModel>(builder: (_, watch, __) {
                  // final _contestWatch = watch.watch(_contestProvider);
                  return SmartRefresher(
                    controller: _refreshController,
                    onRefresh: () => watch.getListContest(),
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
        });
  }
}
