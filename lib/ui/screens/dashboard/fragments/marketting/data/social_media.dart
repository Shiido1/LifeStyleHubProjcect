import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';
import 'package:share/share.dart';

class SocialMediaModel {
  String? media;
  Color? color;
  Function? onTap;

  SocialMediaModel({this.media, this.color, this.onTap});

  static List<SocialMediaModel> getSocialMedia() {
    List<SocialMediaModel> _media = [];
    Data? getResourcesModel;

    SocialMediaModel _social = SocialMediaModel(
        media: 'assets/svgs/whatsapp.svg',
        color: Color(0xff4CAF50),
        onTap: () {
          Share.share(getResourcesModel!.content!.path!);
        });
    _media.add(_social);

    _social = SocialMediaModel(
        media: 'assets/svgs/facebook.svg',
        color: Color(0xff1877F2),
        onTap: () => Share.share('getResourcesModel!.content!.path!'));
    _media.add(_social);

    _social = SocialMediaModel(
        media: 'assets/svgs/twitter.svg', color: Color(0xff1DA1F2));
    _media.add(_social);

    _social = SocialMediaModel(
        media: 'assets/svgs/instagram.svg', color: Color(0xff000000));
    _media.add(_social);

    _social = SocialMediaModel(
        media: 'assets/svgs/telegram.png', color: Color(0xff26A4E3));
    _media.add(_social);

    _social = SocialMediaModel(
        media: 'assets/svgs/snapchat.svg', color: Color(0xffF7F401));
    _media.add(_social);

    return _media;
  }
}
