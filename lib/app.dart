import 'package:flutter/cupertino.dart';
import 'importer.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user; // ユーザー

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    // サインインしてる場合
    if (widget.user != null) {
      // ユーザードキュメントを取得
      AppDataManager.getUser(ref);

      // アカウント連携状況を取得
      // プロバイダの値を更新するため画面描画に処理を行う
      WidgetsBinding.instance.addPostFrameCallback((_) {
        UserManager.getUserProvider(ref, widget.user!);
      });
    }

    // 現在の設定内容をアプリに反映
    AppDataManager.getSettings(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(darkModeProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) {
        return MaterialApp(
          theme: isDark ? AppTheme.darkTheme() : AppTheme.lightTheme(),
          debugShowCheckedModeBanner: false,
          locale: const Locale('ja', 'JP'),
          supportedLocales: const [Locale('ja', 'JP')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate
          ],
          initialRoute: '/',
          routes: {
            '/login': (_) => const LoginPage(),
            '/settings': (_) => const SettingsPage(),
            '/linkAccount': (_) => const LinkAccountPage(),
            '/darkMode': (_) => const DarkModePage(),
            '/bottomNav': (_) => const BottomNavBar(),
          },
          home: widget.user == null ? const LoginPage() : const BottomNavBar(),
        );
      },
    );
  }
}
