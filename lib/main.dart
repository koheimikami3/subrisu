import 'package:subrisu/importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();

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
