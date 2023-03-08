import 'package:subrisu/importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  final remoteConfig = FirebaseRemoteConfig.instance;

  // アプリチェックを実行
  await FirebaseAppCheck.instance.activate();

  // RemoteConfigの設定
  // 値の変更が即反映されるようfetchIntervalを1秒に設定
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 1),
    ),
  );

  // RemoteConfigの各値を取得
  await remoteConfig.fetchAndActivate();

  // アプリ画面を縦固定に設定
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // インスタンス化が非同期のクラスのシングルトンを作成
  GetIt.I
    ..registerSingleton(await SharedPreferences.getInstance())
    ..registerSingleton(await PackageInfo.fromPlatform());

  // Firebaseにサインインしているユーザーを取得
  final user = FirebaseAuth.instance.currentUser;

  runApp(
    ProviderScope(
      child: MyApp(user: user),
    ),
  );
}
