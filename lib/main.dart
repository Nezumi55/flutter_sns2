//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_sns/constants/strings.dart';
import 'package:flutter_sns/constants/themes.dart';
import 'package:flutter_sns/details/sns_bottom_navigation_bar.dart';
import 'package:flutter_sns/details/sns_drawer.dart';
// model
import 'package:flutter_sns/models/main_model.dart';
import 'package:flutter_sns/models/sns_bottom_navigation_bar_model.dart';
import 'package:flutter_sns/models/themes_model.dart';
import 'package:flutter_sns/views/login_page.dart';
//options
import 'firebase_options.dart';
//constants
//components
import 'package:flutter_sns/views/main/home_screen.dart';
import 'package:flutter_sns/views/main/search_screen.dart';
import 'package:flutter_sns/views/main/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? onceUser = FirebaseAuth.instance.currentUser;
    final ThemeModel themeModel = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: themeModel.isDarkTheme
          ? darkThemeData(context: context)
          : lightThemeData(context: context),
      home: onceUser == null
          ? const LoginPage()
          : MyHomePage(title: appTitle, themeModel: themeModel),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.themeModel,
  }) : super(key: key);
  final String title;
  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final SNSBottomNavigationBarModel snsBottomNavigationBarModel =
        ref.watch(snsBottomNavigationBarProvider);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          // style: const TextStyle(color: Colors.black),
        ),
      ),
      drawer: SNSDrawer(mainModel: mainModel, themeModel: themeModel),
      body: mainModel.isLoading
          ? const Center(
              child: Text(loadingText),
            )
          : PageView(
              controller: snsBottomNavigationBarModel.pageController,
              onPageChanged: (index) =>
                  snsBottomNavigationBarModel.onPageChanged(index: index),
              children: [
                  HomeScreen(mainModel: mainModel),
                  SearchScreen(mainModel: mainModel),
                  ProfileScreen(mainModel: mainModel),
                ]),
      bottomNavigationBar: SNSBottomNavigationBar(
          snsBottomNavigationBarModel: snsBottomNavigationBarModel),
    );
  }
}
