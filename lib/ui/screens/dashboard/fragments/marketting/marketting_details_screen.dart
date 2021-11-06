import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import '../profile/dao/profile_dao.dart';
import '../profile/model/users_profile_model.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../../helper/video_player.dart';
import 'dao/marketting_dao.dart';
import 'data/enum.dart';
import 'data/social_media.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';

import 'model/get_resources_model.dart';
import 'viewmodel/marketting_viewmodel.dart';

// ignore: must_be_immutable
class MarkettingDetailScreen extends StatefulWidget {
  Data? getResourcesModel;
  MarketingType type;
  final _markettingViewModel =
      ChangeNotifierProvider((ref) => MarkettingViewmodel());

  MarkettingViewmodel? _marketting;

  MarkettingDetailScreen(
      {Key? key,
      required this.getResourcesModel,
      this.type = MarketingType.Unknown})
      : super(key: key);

  @override
  _MarkettingDetailScreenState createState() => _MarkettingDetailScreenState(
      getResourcesModel: getResourcesModel, type: type);
}

class _MarkettingDetailScreenState extends State<MarkettingDetailScreen> {
  final _videoPlayerModel = ChangeNotifierProvider((ref) => VideoPlayer());
  Data? getResourcesModel;
  MarketingType? type;
  final _markettingViewModel =
      ChangeNotifierProvider((ref) => MarkettingViewmodel());

  MarkettingViewmodel? _marketting;

  UsersProfileModel? _profileModel;

  _MarkettingDetailScreenState({required this.getResourcesModel, this.type});

  @override
  void initState() {
    _marketting = context.read(_markettingViewModel);
    _marketting!.init(context);
    _getCatchedInfos();
    super.initState();
  }

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _player = watch(_videoPlayerModel);
      if (type == MarketingType.Video)
        _player.playVideo(format(getResourcesModel!.content!.path!));

      return Scaffold(
        appBar: getCustomAppBar(context,
            title: '',
            showLeadig: true,
            centerTitle: true,
            image: _profileModel?.profilePic ?? '',
            initial: _profileModel?.name ?? 'LH'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            type != MarketingType.Video
                ? Container(
                    height: 266,
                    child: Stack(
                      children: [
                        ImageLoader(
                          path: getResourcesModel!.featuredImage,
                          fit: BoxFit.cover,
                          isCurvedEdge: true,
                          radius: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ButtonWidget(
                                  buttonText: 'SHARE',
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
                                  text: getResourcesModel!.title ?? '',
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
                      ],
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BetterPlayerMultipleGestureDetector(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: BetterPlayer(
                            controller: _player.betterPlayerController),
                      ),
                      onTap: () {
                        print("Tap!");
                      },
                    ),
                  ),
            SizedBox(height: 24),
            TextView(
              text: getResourcesModel!.title!,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Pallets.grey600,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 23),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Icon(
            //             CupertinoIcons.eye,
            //             color: Pallets.grey400,
            //           ),
            //           SizedBox(width: 8),
            //           TextView(
            //             text: '1.2K views',
            //             fontWeight: FontWeight.w500,
            //             fontSize: 12,
            //             color: Pallets.grey400,
            //             textAlign: TextAlign.left,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       flex: 3,
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Icon(
            //             CupertinoIcons.share,
            //             color: Pallets.grey400,
            //           ),
            //           SizedBox(width: 8),
            //           TextView(
            //             text: '400 shares',
            //             fontWeight: FontWeight.w500,
            //             fontSize: 12,
            //             color: Pallets.grey400,
            //             textAlign: TextAlign.left,
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(height: 24),
            // TextView(
            //   text: 'Share this',
            //   fontWeight: FontWeight.w700,
            //   fontSize: 16,
            //   color: Pallets.grey800,
            //   textAlign: TextAlign.left,
            // ),
            // SizedBox(height: 10),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: SocialMediaModel.getSocialMedia()
            //         .map((social) => Container(
            //             height: 60,
            //             width: 60,
            //             margin: EdgeInsets.only(right: 16.5),
            //             decoration: BoxDecoration(
            //                 shape: BoxShape.circle, color: social.color),
            //             child: ImageLoader(
            //               path: social.media!,
            //             )))
            //         .toList(),
            //   ),
            // ),
            // SizedBox(height: 30),

            ValueListenableBuilder(
                valueListenable: markettingDao!.getListenable()!,
                builder: (_, Box<dynamic> box, __) {
                  List<Data> _marketing = markettingDao!.convert(box);
                  _marketting!.sortContentByType(_marketing);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Similar videos',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Pallets.grey800,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _marketting!.videoContents
                              .map(
                                (element) => Container(
                                  margin: EdgeInsets.only(right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                      ),
                                      ImageLoader(
                                          width: 218,
                                          height: 127,
                                          onTap: () => null,
                                          path: element.featuredImage!),
                                      SizedBox(height: 8),
                                      Text(element.title!)
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  );
                })
          ]),
        ),
      );
    });
  }
}
