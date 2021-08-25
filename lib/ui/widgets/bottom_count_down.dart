import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/timer/countdown.dart';
import 'package:lifestyle_hub/utils/timer/countdown_controller.dart';

import 'buttons.dart';
import 'glass_container.dart';
import 'text_views.dart';

class ButtomCountDownWidget extends StatelessWidget {
  ButtomCountDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTrialDuration(),
        builder: (context, AsyncSnapshot<Duration> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return Container();
          }
          CountdownController _countdownController = CountdownController(
              duration: Duration(
                  days: snapshot.data!.inDays,
                  minutes: snapshot.data!.inHours,
                  seconds: snapshot.data!.inMinutes),
              onEnd: () {
                print('onEnd');
              });
          _countdownController.start();
          return Align(
            alignment: Alignment.bottomCenter,
            child: Countdown(
              countdownController: _countdownController,
              builder: (_, duration) {
                return GlassContainer(
                  blur: 10,
                  shadowStrength: 10,
                  opacity: 0.3,
                  border: Border.fromBorderSide(BorderSide.none),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextView(
                                  text: '${duration.inDays}:',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                  color: Pallets.red500,
                                  textAlign: TextAlign.left,
                                ),
                                TextView(
                                  text: 'Day',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Pallets.grey600,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextView(
                                  text: '${duration.inHours % 24}:',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                  color: Pallets.red500,
                                  textAlign: TextAlign.left,
                                ),
                                TextView(
                                  text: 'Hours',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Pallets.grey600,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextView(
                                  text: '${duration.inMinutes % 60}',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                  color: Pallets.red500,
                                  textAlign: TextAlign.left,
                                ),
                                TextView(
                                  text: 'Min',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Pallets.grey600,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: getDeviceWidth(context) / 4),
                        Expanded(
                          child: ButtonWidget(
                            width: getDeviceWidth(context),
                            buttonText: 'Subscribe now',
                            color: Pallets.white,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            fontStyle: FontStyle.normal,
                            borderColor: Pallets.orange500,
                            primary: Pallets.orange500,
                            onPressed: () => null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
