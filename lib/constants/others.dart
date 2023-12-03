import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sns/constants/strings.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker imagePicker = ImagePicker();

Future<XFile> returnXFile() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image!;
}

Future<File?> returnCroppedFile({required XFile? xFile}) async {
  final instance = ImageCropper();
  final File? result = await instance.cropImage(
      sourcePath: xFile!.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: cropperTitle,
        toolbarColor: Colors.grey,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: false,
      ),
      iosUiSettings: const IOSUiSettings(
        title: cropperTitle,
      ));
  return result;
}
