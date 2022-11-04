import 'package:flutter/cupertino.dart';
import 'constant/configs.dart' as configs;
import 'importer.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final User? user;

  @override
  void initState() {
    super.initState();
    final auth = FirebaseAuth.instance;

    // Firebaseにログインしているユーザーを取得
    user = auth.currentUser;

    // アカウント連携状況を取得
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (user != null) {
        if (!user!.isAnonymous) {
          final userInfoList = auth.currentUser!.providerData;
          final providerId = userInfoList.first.providerId;
          if (providerId == 'google.com') {
            ref.read(accountProvider.notifier).state = 'Google';
          }
        }
      }
    });

    // ログインユーザーが存在する場合、ユーザーデータを取得
    if (user != null) getUserData();

    // 端末内の設定データを取得
    getSettingData();
  }

  /// ユーザーデータを取得する
  Future<void> getUserData() async {
    final repository = ref.read(userViewModelProvider.notifier);

    await repository.getUser(user!.uid);
  }

  /// 設定データを取得し、アプリに反映する
  Future<void> getSettingData() async {
    // アプリバージョンを取得し、プロバイダに保存
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    ref.watch(appVersionProvider.notifier).state = version;

    // テーマ設定状況を取得
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getInt(configs.themeKey) ?? 0;

    // 「端末設定と同じ」の場合、端末のテーマ設定を取得し、ダークモードか判定
    if (theme == configs.deviceTheme) {
      ref.watch(themeSettingProvider.notifier).state = configs.deviceTheme;

      final brightness = MediaQuery.platformBrightnessOf(context);
      final isDark = brightness == Brightness.dark;
      ref.watch(darkModeProvider.notifier).state = isDark;
    }

    // 「ライトモード」の場合
    if (theme == configs.lightTheme) {
      ref.watch(themeSettingProvider.notifier).state = configs.lightTheme;
      ref.watch(darkModeProvider.notifier).state = false;
    }

    // 「ダークモード」の場合
    if (theme == configs.darkTheme) {
      ref.watch(themeSettingProvider.notifier).state = configs.darkTheme;
      ref.watch(darkModeProvider.notifier).state = true;
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
            '/linkAccount': (_) => const LinkAccountPage(),
            '/darkMode': (_) => const DarkModePage(),
            '/bottomNav': (_) => const BottomNavBar(),
          },
          home: user == null ? const LoginPage() : const BottomNavBar(),
        );
      },
    );
  }
}
