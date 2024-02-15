import 'package:subrisu/importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();

  // AppCheckを実施
  await FirebaseAppCheck.instance.activate();

  // RemoteConfigを取得
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  // アプリ画面を縦固定に設定
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // インスタンス化が非同期のクラスのシングルトンを作成
  GetIt.I
    ..registerSingleton(await SharedPreferences.getInstance())
    ..registerSingleton(await PackageInfo.fromPlatform());

  runApp(
    const ProviderScope(child: MyApp()),
  );
}
