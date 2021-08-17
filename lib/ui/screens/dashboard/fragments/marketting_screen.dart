import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/data/mocked_data.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/active_packages.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/glass_container.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class MarkettingScreen extends StatefulWidget {
  MarkettingScreen({Key? key}) : super(key: key);

  @override
  _MarkettingScreenState createState() => _MarkettingScreenState();
}

class _MarkettingScreenState extends State<MarkettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            height: 266,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Pallets.black),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ButtonWidget(
                          buttonText: 'VIDEO',
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
                          text:
                              'The Lifestyle Hub Alternative Real Estate (Housing) Solution',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Pallets.white,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GlassContainer(
                    blur: 10,
                    shadowStrength: 10,
                    height: 56,
                    opacity: 0.3,
                    width: getDeviceWidth(context),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    border: Border.fromBorderSide(BorderSide.none),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView(
                            text: 'Watch now',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Pallets.white,
                            textAlign: TextAlign.left,
                            onTap: () => null,
                          ),
                          Icon(
                            Icons.play_arrow,
                            color: Pallets.white,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ...MockedData.getMockedData()
              .map((mocked) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: mocked.header!,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Pallets.grey500,
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
                      SizedBox(
                        height: 23,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: mocked.images!
                              .map(
                                (e) => Container(
                                  margin: EdgeInsets.only(right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(e),
                                      SizedBox(height: 8),
                                      Text(mocked.title!)
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 41,
                      ),
                    ],
                  ))
              .toList(),
          SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }
}
