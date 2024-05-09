import '../../../constant/texts.dart' as texts;
import '../../importer.dart';

/// ログインエラー画面
class LoginErrorPage extends StatelessWidget {
  const LoginErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(texts.loginErrorPageTitle)),
      body: const LoginErrorPageBody(),
    );
  }
}
