import 'package:subrisu/importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();

  // AppCheckを実施
  await FirebaseAppCheck.instance.activate();

  // アプリ画面を縦固定に設定
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
