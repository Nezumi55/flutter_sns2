//flutter
import 'package:flutter/material.dart';
//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// comstants
import 'package:flutter_sns/constants/routes.dart' as routes;
import 'package:flutter_sns/constants/strings.dart';
//domain
import 'package:flutter_sns/domain/firestore_user/firestore_user.dart';

final signupProvider = ChangeNotifierProvider((ref) => SignupModel());

class SignupModel extends ChangeNotifier {
  int counter = 0;
  User? currentUser;
  //auth
  String email = "";
  String password = "";
  bool isObscure = true;

  Future<void> createFirestoreUser({
    required BuildContext context,
    required String uid,
  }) async {
    final Timestamp now = Timestamp.now();
    final FirestoreUser firestoreUser = FirestoreUser(
      createdAt: now,
      updatedAt: now,
      email: email,
      followerCount: 0,
      followingCount: 0,
      userName: userName,
      userImageURL: "",
      uid: uid,
    );
    final Map<String, dynamic> userData = firestoreUser.toJson();
    await FirebaseFirestore.instance.collection(usersFieldKey).doc(uid).set(userData);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text(userCreatedMsg)));
    notifyListeners();
  }

  Future<void> createUser({required BuildContext context}) async {
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
      routes.toMyApp(context: context);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
