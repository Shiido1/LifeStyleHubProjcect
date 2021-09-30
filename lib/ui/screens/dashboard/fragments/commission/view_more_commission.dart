import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/viewmodel/commission_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/viewmodel/point_history_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/widget/filter_modal.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/multi_color_widget.dart';
import '../../../../widgets/bottom_count_down.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../widgets/overlay.dart';
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
  int? _value = 0;
  List<String> _valueList = [
    'Open Commission',
    'Closed Commission',
    'Replied',
    'Answered ticket',
  ];

  final TextEditingController _textEditingController = TextEditingController();
  final _commissionProvider =
      ChangeNotifierProvider((ref) => CommissionViewmodel());

  CommissionViewmodel? _commissionViewmodel;

  @override
  void initState() {
    _getCatchedInfos();
    _commissionViewmodel = context.read(_commissionProvider);
    _commissionViewmodel!.init(context);
    _commissionViewmodel!.getCommissions();
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
            title: 'Ticket details',
            showLeadig: true,
            image: _profileModel?.profilePic ?? '',
            showImage: true,
            showMoreMenu: false,
            centerTitle: true,
            onTap: () {}),
        body: ValueListenableBuilder(
            valueListenable: commissionDao!.getListenable()!,
            builder: (_, Box<dynamic> box, __) {
              CommissionModel? _commissionModel = commissionDao!.convert(box);
              return Consumer(builder: (context, watch, child) {
                final _commission = watch(_commissionProvider);
                if (_commission.loading) {
                  return Center(
                    child: SpinKitCubeGrid(
                      color: Pallets.orange600,
                    ),
                  );
                }
                return Padding(
                    padding: const EdgeInsets.all(16.0),
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
                                      refresh: true);
                                },
                                onSaved: (value) {
                                  _commissionViewmodel!.getCommissions(
                                      search: value, refresh: true);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Pallets.orange500),
                                child: Center(
                                    child: ImageLoader(
                                        onTap: () => showTicketFiltering(
                                            context,
                                            callBack: (filter) {}),
                                        path: 'assets/svgs/filter.svg')),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _commissionModel
                                .commissionHistory?.data?.length,
                            itemBuilder: (context, index) {
                              final commission = _commissionModel
                                  .commissionHistory?.data?[index];
                              return MultiColorWidget(
                                  title: commission?.fullname ?? '',
                                  bgColor: index % 2 == 0
                                      ? Pallets.orange100
                                      : Pallets.white,
                                  package: commission?.packageName ?? '',
                                  points:
                                      formatCurrency(commission?.amount ?? 0),
                                  date: commission?.date ?? '');
                            }),
                      ],
                    ));
              });
            }));
  }
}
