import 'package:flutter/material.dart';
import 'package:flutter_sns/constants/strings.dart';

import 'package:flutter_sns/models/main_model.dart';
import 'package:flutter_sns/constants/routes.dart' as routes;
import 'package:flutter_sns/details/rounded_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40.0),
        Text("現在ログインしているユーザーの名前は${mainModel.currentUserDoc["userName"]}です。"),
        const SizedBox(height: 40.0),
        RoundedButton(
          onPressed: () => routes.toSignupPage(context: context),
          widthRate: 0.7,
          color: Colors.orange.withOpacity(0.6),
          text: signupTitle,
        ),
        const SizedBox(height: 40.0),
        RoundedButton(
          onPressed: () => routes.toLoginPage(context: context),
          widthRate: 0.7,
          color: Colors.blue.withOpacity(0.6),
          text: loginTitle,
        ),
        const SizedBox(height: 40.0),
        RoundedButton(
          onPressed: () =>
              mainModel.logout(context: context, mainModel: mainModel),
          widthRate: 0.7,
          color: Colors.red.withOpacity(0.6),
          text: logoutText,
        ),
      ],
    );
  }
}
