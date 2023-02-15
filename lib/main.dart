import 'package:subrisu/importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  final auth = FirebaseAuth.instance;
  final remoteConfig = FirebaseRemoteConfig.instance;

  // RemoteConfigの各値を取得
  await remoteConfig.fetchAndActivate();

  // アプリ画面を縦固定に設定
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // インスタンス化が非同期のクラスのシングルトンを作成
  GetIt.I
    ..registerSingleton(await SharedPreferences.getInstance())
    ..registerSingleton(await PackageInfo.fromPlatform());

  // Firebaseにサインインしているユーザーを取得
  final user = auth.currentUser;

  runApp(
    ProviderScope(
      child: MyApp(user: user),
    ),
  );
}
