// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import '../../../../../helper/helper_handler.dart';
import 'viewmodel/commission_viewmodel.dart';
import '../profile/dao/profile_dao.dart';
import '../profile/model/users_profile_model.dart';
import '../../widget/multi_color_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/viewmodel/commission_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/multi_color_widget.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../../utils/pallets.dart';
import 'dao/commission_dao.dart';
import 'model/commission_model.dart';

class ViewMoreCommissionScreen extends StatefulWidget {
  const ViewMoreCommissionScreen({Key? key}) : super(key: key);

  @override
  _ViewMoreCommissionScreenState createState() =>
      _ViewMoreCommissionScreenState();
}

class _ViewMoreCommissionScreenState extends State<ViewMoreCommissionScreen> {
  // ignore: unused_field
  int? _value = 0;
  // ignore: unused_field
  List<String> _valueList = [
    'Open Commission',
    'Closed Commission',
    'Replied',
    'Answered ticket',
  ];

  final TextEditingController _textEditingController = TextEditingController();

  CommissionViewmodel? _commissionViewmodel;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _getCatchedInfos();
    _commissionViewmodel =
        Provider.of<CommissionViewmodel>(context, listen: false);
    _commissionViewmodel!.init(context);
    _commissionViewmodel!.getCommissions();
    _refreshController.refreshCompleted();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getCustomAppBar(context,
            title: 'My Commissions',
            showLeadig: true,
            centerTitle: true,
            image: _profileModel?.profilePic ?? '',
            initial: _profileModel?.name ?? 'LH'),
        body: Consumer<CommissionViewmodel>(
          builder: (context, provider, child) {
            return ValueListenableBuilder(
                valueListenable: commissionDao!.getListenable()!,
                builder: (_, Box<dynamic> box, __) {
                  CommissionModel? _commissionModel =
                      commissionDao!.convert(box);

                  if (provider.loading) {
                    return Center(
                      child: SpinKitCubeGrid(
                        color: Pallets.orange600,
                      ),
                    );
                  }
                  return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SmartRefresher(
                        controller: _refreshController,
                        enablePullUp: true,
                        onRefresh: () => _commissionViewmodel!.getCommissions(),
                        onLoading: () => _commissionViewmodel!
                            .loadPagination(_textEditingController.text),
                        child: ListView(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: EditFormField(
                                    label: 'Search commissions',
                                    controller: _textEditingController,
                                    keyboardType: TextInputType.text,
                                    suffixIcon: Icons.search,
                                    suffixIconColor: Pallets.orange600,
                                    textInputAction: TextInputAction.search,
                                    onPasswordToggle: () {
                                      _commissionViewmodel!.getCommissions(
                                          search: _textEditingController.text,
                                          isRefreshing: true);
                                    },
                                    onSaved: (value) {
                                      _commissionViewmodel!.getCommissions(
                                          search: value, isRefreshing: true);
                                    },
                                  ),
                                ),
                                // SizedBox(
                                //   width: 16,
                                // ),
                                // Expanded(
                                //   child: Container(
                                //     height: 48,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(8),
                                //         color: Pallets.orange500),
                                //     child: Center(
                                //         child: ImageLoader(
                                //             onTap: () => showTicketFiltering(
                                //                 context,
                                //                 callBack: (filter) {}),
                                //             path: 'assets/svgs/filter.svg')),
                                //   ),
                                // )
                              ],
                            ),
                            SizedBox(height: 16),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.data.length,
                                itemBuilder: (context, index) {
                                  final commission = provider.data[index];
                                  return MultiColorWidget(
                                      title: commission?.fullname ?? '',
                                      bgColor: index % 2 == 0
                                          ? Pallets.orange100
                                          : Pallets.white,
                                      package: commission?.packageName ?? '',
                                      points: formatCurrency(
                                          commission?.amount ?? 0),
                                      date: commission?.date ?? '');
                                })
                          ],
                        ),
                      ));
                });
          },
        ));
  }
}
