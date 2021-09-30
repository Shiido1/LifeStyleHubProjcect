import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'dao/ticket_dao.dart';
import 'viewmodel/ticket_viewmodel.dart';
import 'widget/filter_modal.dart';
import '../../../../widgets/bottom_count_down.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../widgets/overlay.dart';
import '../../../../../utils/pallets.dart';

import 'model/my_ticket_model.dart';
import 'widget/ticket_list_widget.dart';

class ViewMoreTicketsScreen extends StatefulWidget {
  const ViewMoreTicketsScreen({Key? key}) : super(key: key);

  @override
  _ViewMoreTicketsScreenState createState() => _ViewMoreTicketsScreenState();
}

class _ViewMoreTicketsScreenState extends State<ViewMoreTicketsScreen> {
  final _ticketNotifier = ChangeNotifierProvider((ref) => TicketViewmodel());

  TicketViewmodel? _ticketViewmodel;
  int? _value = 0;
  List<String> _valueList = [
    'Open tickets',
    'Closed tickets',
    'Replied',
    'Answered ticket',
  ];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _getCatchedInfos();
    _ticketViewmodel = context.read(_ticketNotifier);
    _ticketViewmodel!.init(context);
    _ticketViewmodel!.getAllTickets();
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
            valueListenable: ticketDao!.getListenable()!,
            builder: (_, Box<dynamic> box, __) {
              List<Data> _ticket = ticketDao!.convert(box);
              return Consumer(builder: (context, watch, child) {
                final _response = watch(_ticketNotifier);
                if (_response.loading) {
                  return Center(
                    child: SpinKitCubeGrid(
                      color: Pallets.orange600,
                    ),
                  );
                }
                return LoadingOverlay(
                  isLoading: false,
                  child: Stack(
                    children: [
                      Padding(
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
                                    label: 'Search tickets',
                                    controller: _textEditingController,
                                    keyboardType: TextInputType.emailAddress,
                                    suffixIcon: Icons.search,
                                    suffixIconColor: Pallets.orange600,
                                    textInputAction: TextInputAction.search,
                                    onPasswordToggle: () {
                                      _ticketViewmodel!.getAllTickets(
                                          search: _textEditingController.text,
                                          refresh: true);
                                    },
                                    onSaved: (value) {
                                      _ticketViewmodel!.getAllTickets(
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
                            SizedBox(height: 32),
                            Container(
                              height: 30,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List<Widget>.generate(
                                  _valueList.length,
                                  (int index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 16),
                                      child: ChoiceChip(
                                        side: BorderSide(
                                            width: 0.5,
                                            color: _value == index
                                                ? Pallets.orange500
                                                : Pallets.grey800),
                                        backgroundColor: Pallets.white,
                                        label: Text(
                                          _valueList[index],
                                          style: TextStyle(
                                              color: _value == index
                                                  ? Pallets.white
                                                  : Pallets.grey500),
                                        ),
                                        selectedColor: Pallets.orange500,
                                        selected: _value == index,
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _value = selected ? index : null;
                                          });
                                        },
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(height: 32),
                            ..._ticket
                                .map((element) => TicketListWidget(element))
                                .toList(),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
                      ButtomCountDownWidget()
                    ],
                  ),
                );
              });
            }));
  }
}
