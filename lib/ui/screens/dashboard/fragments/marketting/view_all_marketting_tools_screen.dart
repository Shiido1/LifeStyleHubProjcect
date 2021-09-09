import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../../helper/routes/navigation.dart';
import 'viewmodel/marketting_viewmodel.dart';
import '../ticket/widget/filter_modal.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../../utils/pallets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'data/enum.dart';
import 'marketting_details_screen.dart';

class ViewAllMarkettingScreen extends StatefulWidget {
  final MarketingType? marketingType;

  ViewAllMarkettingScreen({Key? key, required this.marketingType})
      : super(key: key);

  @override
  _ViewAllMarkettingScreenState createState() =>
      _ViewAllMarkettingScreenState();
}

class _ViewAllMarkettingScreenState extends State<ViewAllMarkettingScreen> {
  final _markettingViewModel =
      ChangeNotifierProvider((ref) => MarkettingViewmodel());

  MarkettingViewmodel? _marketting;

  @override
  void initState() {
    _marketting = context.read(_markettingViewModel);
    _marketting!.init(context);
    _marketting!.getMarketingViewAll(_getType());
    super.initState();
  }

  String _getType() {
    if (widget.marketingType == MarketingType.Video) return 'video';
    if (widget.marketingType == MarketingType.Banner) return 'banner';
    if (widget.marketingType == MarketingType.Post) return 'post';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          showImage: true,
          image:
              'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29tYW4lMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
          showLeadingWidget: true,
          showLeadig: true,
          title: 'More Views',
          centerTitle: true),
      body: Consumer(builder: (context, watch, child) {
        final _response = watch(_markettingViewModel);
        if (_response.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SmartRefresher(
            controller: _marketting!.refreshController,
            onRefresh: () => _marketting!.getMarketingViewAll(_getType()),
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
                ..._response.getResourceModelList!.map((element) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        ImageLoader(
                            width: getDeviceWidth(context),
                            height: getDeviceHeight(context) * .2,
                            isCurvedEdge: true,
                            curve: 10,
                            onTap: () => PageRouter.gotoWidget(
                                  MarkettingDetailScreen(
                                    getResourcesModel: element,
                                    type: MarketingType.Video,
                                  ),
                                  context,
                                  animationType: PageTransitionType.fade,
                                ),
                            fit: BoxFit.cover,
                            path: element.featuredImage!),
                        SizedBox(height: 8),
                        Text(
                          element.title!,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  );
                }).toList()
              ],
            ),
          ),
        );
      }),
    );
  }
}
