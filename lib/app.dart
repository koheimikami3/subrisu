import 'package:flutter/cupertino.dart';
import 'constant/configs.dart' as configs;
import 'importer.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user; // Firebaseにログインしているユーザー

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    // ログインユーザーが存在する場合、ユーザーデータを取得
    if (widget.user != null) getUserData();

    // 端末内の設定データを取得
    getSettingData();
  }

  /// ユーザーデータを取得する
  Future<void> getUserData() async {
    final repository = ref.read(userViewModelProvider.notifier);

    await repository.getUser(widget.user!.uid);
  }

  /// 設定データを取得し、アプリに反映する
  Future<void> getSettingData() async {
    // テーマ設定状況を取得
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getInt(configs.themeKey) ?? 0;

    // 「端末設定と同じ」の場合、端末のテーマ設定を取得し、ダークモードか判定
    if (theme == configs.deviceTheme) {
      ref.read(themeSettingProvider.notifier).state = configs.deviceTheme;

      // ignore: use_build_context_synchronously
      final brightness = MediaQuery.platformBrightnessOf(context);
      final isDark = brightness == Brightness.dark;
      ref.read(darkModeProvider.notifier).state = isDark;
    }

    // 「ライトモード」の場合
    if (theme == configs.lightTheme) {
      ref.read(themeSettingProvider.notifier).state = configs.lightTheme;
      ref.read(darkModeProvider.notifier).state = false;
    }

    // 「ダークモード」の場合
    if (theme == configs.darkTheme) {
      ref.read(themeSettingProvider.notifier).state = configs.darkTheme;
      ref.read(darkModeProvider.notifier).state = true;
    }
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
            '/darkMode': (_) => const DarkModePage(),
            '/bottomNav': (_) => const BottomNavBar(),
          },
          home: widget.user == null ? const LoginPage() : const BottomNavBar(),
        );
      },
    );
  }
}
