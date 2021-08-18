import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/video_player.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/data/social_media.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class MarkettingDetailScreen extends StatefulWidget {
  MarkettingDetailScreen({Key? key}) : super(key: key);

  @override
  _MarkettingDetailScreenState createState() => _MarkettingDetailScreenState();
}

class _MarkettingDetailScreenState extends State<MarkettingDetailScreen> {
  final _videoPlayerModel = ChangeNotifierProvider((ref) => VideoPlayer());

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _player = watch(_videoPlayerModel);
      return Scaffold(
        appBar: getCustomAppBar(context,
            title: '',
            showLeadig: true,
            changeLeadingIcon: true,
            image:
                'https://images.unsplash.com/photo-1558185348-fe8fa4cf631f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            BetterPlayerMultipleGestureDetector(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(controller: _player.betterPlayerController),
              ),
              onTap: () {
                print("Tap!");
              },
            ),
            SizedBox(height: 24),
            TextView(
              text:
                  'The Lifestyle Hub Alternative Real Estate (Housing) Solution',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Pallets.grey600,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.eye,
                        color: Pallets.grey400,
                      ),
                      SizedBox(width: 9),
                      TextView(
                        text: '1.2K views',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Pallets.grey400,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.share,
                        color: Pallets.grey400,
                      ),
                      SizedBox(width: 9),
                      TextView(
                        text: '400 shares',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Pallets.grey400,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            TextView(
              text: 'Share this',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Pallets.grey800,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: SocialMediaModel.getSocialMedia()
                    .map((social) => Container(
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(right: 16.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: social.color),
                        child: ImageLoader(
                          path: social.media!,
                        )))
                    .toList(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Similar videos',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Pallets.grey800,
                  textAlign: TextAlign.left,
                ),
                TextView(
                  onTap: () {},
                  text: 'View all',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Pallets.grey500,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: 16),
          ]),
        ),
      );
    });
  }
}
