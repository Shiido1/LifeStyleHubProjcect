import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'buttons.dart';
import 'glass_container.dart';
import 'text_views.dart';

class ButtomCountDownWidget extends StatelessWidget {
  const ButtomCountDownWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GlassContainer(
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
                        text: '14:',
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
                        text: '23:',
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
                        text: '60',
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
                  primary: Pallets.orange500,
                  onPressed: () => null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
