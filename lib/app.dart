import 'package:flutter/cupertino.dart';
import 'package:subrisu/importer.dart';

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

    getSettingData();
  }

  /// 設定データを取得し、アプリに反映する
  Future<void> getSettingData() async {
    final prefs = await SharedPreferences.getInstance();

    if (widget.user != null) {
      prefs.setString(Configs.userIdKey, widget.user!.uid);
      final userId = prefs.getString(Configs.userIdKey);
      ref.read(userIdProvider.notifier).state = userId!;
    }

    // テーマ設定状況を取得
    final theme = prefs.getInt(Configs.themeKey) ?? 0;

    // 「端末設定と同じ」の場合、端末のテーマ設定を取得し、ダークモードか判定
    if (theme == Configs.deviceTheme) {
      ref.read(themeSettingProvider.notifier).state = Configs.deviceTheme;

      // ignore: use_build_context_synchronously
      final brightness = MediaQuery.platformBrightnessOf(context);
      final isDark = brightness == Brightness.dark;
      ref.read(darkModeProvider.notifier).state = isDark;
    }

    // 「ライトモード」の場合
    if (theme == Configs.lightTheme) {
      ref.read(themeSettingProvider.notifier).state = Configs.lightTheme;
      ref.read(darkModeProvider.notifier).state = false;
    }

    // 「ダークモード」の場合
    if (theme == Configs.darkTheme) {
      ref.read(themeSettingProvider.notifier).state = Configs.darkTheme;
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
