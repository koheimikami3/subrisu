import 'package:flutter/cupertino.dart';

import 'importer.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    super.key,
    required this.user,
  });

  final User? user; // ユーザー

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    final userManager = UserManager();

    // テーマ設定状況を取得し、アプリに反映
    AppManager.getTheme(context, ref);

    // アプリバージョンを取得
    AppManager.getVersion(ref);

    // サインインしていない場合、匿名サインインを行い、ユーザーデータを作成
    if (widget.user == null) {
      userManager.anonymousSingnIn(ref);
    }

    // サインインしてる場合、ユーザーデータを取得
    if (widget.user != null) {
      userManager.getUserData(ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    final isDark = ref.watch(darkModeProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) {
        return MaterialApp(
          theme: isDark ? appTheme.darkTheme() : appTheme.lightTheme(),
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
            '/settings': (_) => const SettingsPage(),
            '/billing': (_) => const BillingPage(),
            '/darkMode': (_) => const DarkModePage(),
            '/bottomNav': (_) => const BottomNavBar(),
          },
          home: const BottomNavBar(),
        );
      },
    );
  }
}
