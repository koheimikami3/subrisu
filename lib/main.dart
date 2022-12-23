import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:subrisu/importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();

  // タイムゾーンデータベースを初期化
  tz.initializeTimeZones();

  // ローカルロケーションのタイムゾーンを東京に設定
  tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));

  // プッシュ通知ダイアログを呼び出す
  // final flnp = FlutterLocalNotificationsPlugin();
  // const iOS = DarwinInitializationSettings();
  // const initSettings = InitializationSettings(iOS: iOS);
  // await flnp.initialize(initSettings);

  // アプリ画面を縦固定に設定
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Firebaseにサインインしているユーザーを取得
  final user = FirebaseAuth.instance.currentUser;

  runApp(
    ProviderScope(
      child: MyApp(user: user),
    ),
  );
}
