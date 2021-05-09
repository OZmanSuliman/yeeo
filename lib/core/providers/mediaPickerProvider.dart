import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MediaPickerProvider extends ChangeNotifier {
  File img;
  pickerGallary(int indx) async {
    print('Picker is called');

    if (indx == 0) {
      img = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 20);
      await cropImage();
      return img;
    } else {
      img = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 20);
      await cropImage();
      return img;
    }
  }

  Future<Null> cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: img.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
    );
    if (croppedFile != null) {
      img = croppedFile;
    }
  }

  void clearImage() {
    img = null;
    notifyListeners();
  }
}
