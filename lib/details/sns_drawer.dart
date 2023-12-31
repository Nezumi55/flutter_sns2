//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sns/constants/routes.dart' as routes;
import 'package:flutter_sns/constants/strings.dart';

import 'package:flutter_sns/models/main_model.dart';
import 'package:flutter_sns/models/themes_model.dart';

class SNSDrawer extends StatelessWidget {
  const SNSDrawer({
    Key? key,
    required this.mainModel,
    required this.themeModel,
  }) : super(key: key);
  final MainModel mainModel;
  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: themeModel.isDarkTheme
                ? Colors.black
                : Colors
                    .white), //themeModel.isDarkTheme?Colors.black:Colors.white))
        child: Drawer(
            child: ListView(children: [
          ListTile(
            title: const Text(accountTitle),
            onTap: () =>
                routes.toAccountPage(context: context, mainModel: mainModel),
          ),
          ListTile(
              title: const Text(themeTitle),
              trailing: CupertinoSwitch(
                  value: themeModel.isDarkTheme,
                  onChanged: (value) =>
                      themeModel.setIsDarkTheme(value: value))),
        ])));
  }
}
