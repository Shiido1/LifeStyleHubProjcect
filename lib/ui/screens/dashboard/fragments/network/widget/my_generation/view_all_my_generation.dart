import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../../../helper/helper_handler.dart';
import '../../viewmodel/network_viewmodel.dart';
import '../history_cards.dart';
import '../../../profile/dao/profile_dao.dart';
import '../../../profile/model/users_profile_model.dart';
import '../../../ticket/widget/filter_modal.dart';
import '../../../../../../widgets/custom_appbar.dart';
import '../../../../../../widgets/edit_form_widget.dart';
import '../../../../../../widgets/image_loader.dart';
import '../../../../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

class ViewMyGenerationScreen extends StatefulWidget {
  ViewMyGenerationScreen({Key? key}) : super(key: key);

  @override
  _ViewMyGenerationScreenState createState() => _ViewMyGenerationScreenState();
}

class _ViewMyGenerationScreenState extends State<ViewMyGenerationScreen> {
  NetworkViewModel? _viewModel;

  @override
  void initState() {
    _viewModel = Provider.of<NetworkViewModel>(context, listen: false);
    _viewModel!.init(context);
    _getCatchedInfos();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    _viewModel!.getUsersGenerationDownline(_profileModel!.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'My Generation',
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH'),
      body: Consumer<NetworkViewModel>(builder: (_, provider, __) {
        if (provider.loading) {
          return Center(
            child: SpinKitCubeGrid(
              color: Pallets.orange600,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: EditFormField(
                      label: 'Search downline',
                      controller: null,
                      keyboardType: TextInputType.emailAddress,
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
                              onTap: () => showTicketFiltering(context,
                                  callBack: (filter) {}),
                              path: 'assets/svgs/filter.svg')),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              ...provider.generationData
                  .map((element) => HistroyCard(
                        historyValues: HistoryValues(
                            name: element.user?.name ?? '',
                            email: element.user?.email ?? '',
                            date: fomartDate(element.createdAt!),
                            packageName: element.package?.name ?? 'N/A',
                            referral: 'Referal Name here'),
                      ))
                  .toList()
            ],
          ),
        );
      }),
    );
  }
}
