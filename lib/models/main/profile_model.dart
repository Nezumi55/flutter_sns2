import 'dart:io';
// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
// constants
import 'package:flutter_sns/constants/others.dart';
import 'package:flutter_sns/constants/strings.dart';

final profileProvider = ChangeNotifierProvider((ref) => ProfileModel());

class ProfileModel extends ChangeNotifier {
  File? croppedFile;

  Future<String> uploadImageAndGetURL(
      {required String uid, required File file}) async {
    final String fileName = returnJpgFileName();
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(uid)
        .child(fileName);
    await storageRef.putFile(file);
    return storageRef.getDownloadURL();
  }

  Future<void> uploadUserImage(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc}) async {
    final XFile xFile = await returnXFile();
    final File file = File(xFile.path);
    final String uid = currentUserDoc.id;
    croppedFile = await returnCroppedFile(xFile: xFile);
    final String url = await uploadImageAndGetURL(uid: uid, file: file);
    await currentUserDoc.reference.update({
      'userImageURL': url,
    });
    notifyListeners();
  }
}
