import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sns/domain/firestore_user/firestore_user.dart';
import 'package:flutter_sns/models/main/search_model.dart';
import 'package:flutter_sns/models/main_model.dart';
// constants
import 'package:flutter_sns/constants/routes.dart' as routes;

class SearchScreen extends ConsumerWidget {
  const SearchScreen({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchModel searchModel = ref.watch(searchProvider);
    return ListView.builder(
      itemCount: searchModel.users.length,
      itemBuilder: (context, index) {
        final FirestoreUser firestoreUser = searchModel.users[index];
        return ListTile(
          title: Text(firestoreUser.userName),
          onTap: () {
            routes.toPassiveUserProfilePage(
                context: context, passiveUser: firestoreUser,mainModel: mainModel);
          },
        );
      },
    );
  }
}
