import 'package:subrisu/importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final auth = FirebaseAuth.instance;

  // アプリ画面を縦固定に設定
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Firebaseにログインしているユーザーを取得
  final user = auth.currentUser;

  runApp(
    ProviderScope(
      child: MyApp(user: user),
    ),
  );
}
