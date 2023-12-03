// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sns/domain/firestore_user/firestore_user.dart';
import 'package:flutter_sns/domain/following_token/following_token.dart';
import 'package:flutter_sns/models/main_model.dart';
// constants
import 'package:flutter_sns/constants/strings.dart';

final passiveUserProfileProvider =
    ChangeNotifierProvider((ref) => PassiveUserProfileModel());

class PassiveUserProfileModel extends ChangeNotifier {
  Future<void> follow(
      {required MainModel mainModel,
      required FirestoreUser passiveUser}) async {
    mainModel.followingUids.add(passiveUser.uid);
    notifyListeners();
    final String tokenId = returnUuidV4();
    final FollowingToken followingToken = FollowingToken(
        createdAt: Timestamp.now(),
        passiveUid: passiveUser.uid,
        tokenId: tokenId);
    final FirestoreUser activeUser = mainModel.firestoreUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .collection('tokens')
        .doc(tokenId)
        .set(followingToken.toJson());
  }

  Future<void> unfollow({
    required MainModel mainModel,
    required FirestoreUser passiveUser,
  }) async {
    mainModel.followingUids.remove(passiveUser.uid);
    notifyListeners();
    final FirestoreUser activeUser = mainModel.firestoreUser;
    final QuerySnapshot<Map<String, dynamic>> qshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(activeUser.uid)
        .collection('tokens')
        .where('passiveUid', isEqualTo: passiveUser.uid)
        .get();
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token = docs.first;
    await token.reference.delete();
  }
}
