//flutter
import 'package:flutter/material.dart';
import 'package:flutter_sns/domain/firestore_user/firestore_user.dart';
import 'package:flutter_sns/main.dart';
import 'package:flutter_sns/models/main_model.dart';
import 'package:flutter_sns/views/main/passive_user_profile_page.dart';
//pages
import 'package:flutter_sns/views/signup_page.dart';
import 'package:flutter_sns/views/login_page.dart';
import 'package:flutter_sns/views/account_page.dart';

void toMyApp({required BuildContext context}) =>
    Navigator.push(context, MaterialPageRoute(builder: ((context) => MyApp())));

void toSignupPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: ((context) => SignupPage())));

void toLoginPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: ((context) => LoginPage())));

void toAccountPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => AccountPage(mainModel: mainModel))));

void toPassiveUserProfilePage(
        {required BuildContext context,
        required FirestoreUser passiveUser,
        required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => PassiveUserProfilePage(
                passiveUser: passiveUser, mainModel: mainModel))));
