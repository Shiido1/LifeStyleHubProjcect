import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../helper/configs/instances.dart';
import 'package:path_provider/path_provider.dart';

import 'pallets.dart';

enum ProfileOptionAction {
  VIEW_IMAGE,
  PROFILE_CAMERA,
  PHOTO_LIBRARY,
  REMOVE_PROFILE_PICTURE,
}

class ImagePickerHandler {
  File? file;

  Future<void> pickImage(
      {@required BuildContext? context, Function(File file)? file}) async {
    ProfileOptionAction? action;
    if (Platform.isAndroid) {
      action = await showModalBottomSheet(
          context: context!,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          builder: (context) => BottomSheet(
              onClosing: () {},
              builder: (context) => Wrap(
                    children: <Widget>[
                      ListTile(
                          title: Center(
                            child: Text(
                              'Pick from library',
                              style: TextStyle(),
                            ),
                          ),
                          onTap: () => Navigator.pop(
                              context, ProfileOptionAction.PHOTO_LIBRARY)),
                      Divider(),
                      ListTile(
                          title: Center(
                            child: Text('Take a photo'),
                          ),
                          onTap: () => Navigator.pop(
                              context, ProfileOptionAction.PROFILE_CAMERA)),
                      InkWell(
                        onTap: () => Navigator.pop(context,
                            ProfileOptionAction.REMOVE_PROFILE_PICTURE),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(12.0),
                          color: Colors.grey[200],
                          child: Center(
                            child: Text('Cancel'),
                          ),
                        ),
                      ),
                    ],
                  )));
    } else if (Platform.isIOS) {
      action = await showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context!,
          builder: (context) => CupertinoActionSheet(
                  actions: <Widget>[
                    CupertinoButton(
                        child: Text('Pick from library'),
                        onPressed: () => Navigator.pop(
                            context, ProfileOptionAction.PHOTO_LIBRARY)),
                    CupertinoButton(
                        child: Text('Take a photo'),
                        onPressed: () => Navigator.pop(
                            context, ProfileOptionAction.PROFILE_CAMERA)),
                  ],
                  cancelButton: CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.pop(context))));
    }

    if (action == null) return;
    final _getFile = await handleProfileAction(context!, action: action);
    file!(_getFile!);
  }

  Future<File?>? handleProfileAction(BuildContext context,
      {@required ProfileOptionAction? action}) {
    switch (action!) {
      case ProfileOptionAction.VIEW_IMAGE:
      case ProfileOptionAction.PHOTO_LIBRARY:
        return _getImage(context, ImageSource.gallery);
      case ProfileOptionAction.PROFILE_CAMERA:
        return _getImage(context, ImageSource.camera);
      case ProfileOptionAction.REMOVE_PROFILE_PICTURE:
        break;
    }
    return null;
  }

  Future<File?> _getImage(BuildContext context, ImageSource source) async {
    try {
      final pickedFile = await ImagePicker.platform.pickImage(source: source);
      if (pickedFile != null) {
        return await _cropImage(context, pickedFile);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<File?> _cropImage(BuildContext context, PickedFile imageFile) async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [CropAspectRatioPreset.square]
            : [CropAspectRatioPreset.square],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'LifeStyleHub',
            toolbarColor: Pallets.orange600
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'LifeStyleHub',
        ));
    final _response = await _compressImageFiles(croppedFile!);

    return _response;
  }

  Future<File?> _compressImageFiles(File mFile) async {
    final _dir = await _findLocalPath();
    final _targetPath = _dir.absolute.path + "/${_generateKey(15)}.jpg";
    File? _result = await FlutterImageCompress.compressAndGetFile(
        mFile.path, _targetPath,
        quality: 10);
    return _result;
  }

//* getting local path
  Future<Directory> _findLocalPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory!;
  }

//* generate key
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String _generateKey(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
