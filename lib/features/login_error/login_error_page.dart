import '../../importer.dart';

/// ログインエラー画面
class LoginErrorPage extends StatelessWidget {
  const LoginErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.loginErrorPageTitle),
      ),
      body: const LoginErrorPageBody(),
    );
  }
}
