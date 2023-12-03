// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sns/constants/strings.dart';
import 'package:flutter_sns/details/user_image.dart';
import 'package:flutter_sns/domain/firestore_user/firestore_user.dart';
//components
import 'package:flutter_sns/details/rounded_button.dart';
import 'package:flutter_sns/models/main_model.dart';
import 'package:flutter_sns/models/passive_user_profile_model.dart';

class PassiveUserProfilePage extends ConsumerWidget {
  const PassiveUserProfilePage({
    Key? key,
    required this.passiveUser,
    required this.mainModel,
  }) : super(key: key);
  final FirestoreUser passiveUser;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);
    final bool isFollowing = mainModel.followingUids.contains(passiveUser.uid);
    final int followerCount = passiveUser.followerCount;
    final int plusOneFollowerCount = passiveUser.followerCount + 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text(profileTitle),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserImage(length: 200.0, userImageURL: passiveUser.userImageURL),
              const SizedBox(height: 20.0),
              Center(
                  child: Text(passiveUser.userName,
                      style: const TextStyle(
                          fontSize: 24.0))),
              const SizedBox(height: 32.0),
              Text('フォロー中 ${passiveUser.followingCount.toString()}人',
                  style: const TextStyle(fontSize: 16.0)),
              const SizedBox(height: 10.0),
              Text(
                  isFollowing
                      ? 'フォロワー ${plusOneFollowerCount.toString()}人'
                      : 'フォロワー ${followerCount.toString()}人',
                  style: const TextStyle(fontSize: 16.0)),
              const SizedBox(height: 40.0),
              isFollowing
                  ? RoundedButton(
                      onPressed: () => passiveUserProfileModel.unfollow(
                          mainModel: mainModel, passiveUser: passiveUser),
                      widthRate: 0.6,
                      color: Colors.red.withOpacity(0.6),
                      text: 'アンフォローする')
                  : RoundedButton(
                      onPressed: () => passiveUserProfileModel.follow(
                          mainModel: mainModel, passiveUser: passiveUser),
                      widthRate: 0.6,
                      color: Colors.blue.withOpacity(0.6),
                      text: 'フォローする',
                    ),
            ]));
  }
}
