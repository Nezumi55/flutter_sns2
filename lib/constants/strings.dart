//titles
import 'package:uuid/uuid.dart';

const String appTitle = "みんちのSNS";
const String signupTitle = "サインアップページ";
const String loginTitle = "ログインページ";
const String cropperTitle = "Cropper";
const String accountTitle = "アカウントページへ";
const String themeTitle = "テーマを変更する";
const String profileTitle = "プロフィールページ";
//texts
const String mailAddressText = " メールアドレス";
const String signupText = "新規登録";
const String passwordText = " パスワード";
const String loginText = "ログイン";
const String logoutText = "ログアウトする";
const String loadingText = "ロード中";
const String uploadText = "画像をアップロードする";
// names
const String userName = "みんち";
//FieldKey
const String usersFieldKey = "users";
// messages
const String userCreatedMsg = "ユーザーが作成されました";
const String noAccountMsg = "アカウントがない方はこちら";
// prefs key
const String isDarkThemePrefsKey = 'isDarkTheme';
//bottom navigation bar
const String homeText = "ホーム";
const String searchText = "検索";
const String profileText = "プロフィール";

String returnUuidV4() {
  Uuid uuid = const Uuid();
  return uuid.v4();
}

String returnJpgFileName() => "${returnUuidV4()}.jpg";
