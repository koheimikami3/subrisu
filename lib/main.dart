import 'package:subrisu/importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();

  // AppCheckを実施
  await FirebaseAppCheck.instance.activate();

  // アプリ画面を縦固定に設定
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Analyticsを実行
  // app_openのログを取る
  await FirebaseAnalytics.instance.logAppOpen();

  // Crashlyticsを実行
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider
            .overrideWithValue(await SharedPreferences.getInstance()),
        packageInfoProvider.overrideWithValue(await PackageInfo.fromPlatform()),
      ],
      child: const MyApp(),
    ),
  );
}
