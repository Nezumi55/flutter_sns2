import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sns/constants/strings.dart';
import 'package:flutter_sns/details/rounded_button.dart';
import 'package:flutter_sns/details/user_image.dart';
import 'package:flutter_sns/domain/firestore_user/firestore_user.dart';
import 'package:flutter_sns/models/main/profile_model.dart';
import 'package:flutter_sns/models/main_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileModel profileModel = ref.watch(profileProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileModel.croppedFile == null
            ? UserImage(length: 200.0, userImageURL: firestoreUser.userImageURL)
            : ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  color: Colors.grey,
                  child: Image.file(profileModel.croppedFile!),
                ),
              ),
        const SizedBox(height: 20.0),
              Center(
                  child: Text(firestoreUser.userName,
                      style: const TextStyle(
                          fontSize: 24.0))),
        const SizedBox(height: 20.0),
        Text('フォロー中 ${firestoreUser.followingCount.toString()}人',
            style: const TextStyle(fontSize: 16.0)),
        const SizedBox(height: 10.0),
        Text('フォロワー ${firestoreUser.followerCount.toString()}人',
            style: const TextStyle(fontSize: 16.0)),
        const SizedBox(height: 40.0),
        RoundedButton(
          onPressed: () async => await profileModel.uploadUserImage(
              currentUserDoc: mainModel.currentUserDoc),
          widthRate: 0.6,
          color: Colors.blue.withOpacity(0.6),
          text: uploadText,
        ),
      ],
    );
  }
}
