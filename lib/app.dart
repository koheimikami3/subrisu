import 'package:flutter/cupertino.dart';
import 'package:subrisu/features/subscription/presentation/login_error/login_error_page.dart';
import 'importer.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    // 購入処理機能を初期化し、課金状況をアプリに反映
    AppManager.initPurchases(ref);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);
    ref.watch(themeSettingNotifierProvider);

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, __) {
        return MaterialApp(
          theme: isDarkMode ? AppTheme.dark() : AppTheme.light(),
          debugShowCheckedModeBanner: false,
          locale: const Locale('ja', 'JP'),
          supportedLocales: const [Locale('ja', 'JP')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          initialRoute: '/',
          routes: {
            '/settings': (_) => const SettingsPage(),
            '/billing': (_) => const BillingPage(),
            '/darkMode': (_) => const DarkModePage(),
            '/tos': (_) => const TosPage(),
            '/privacyPolicy': (_) => const PrivacyPolicyPage(),
            '/bottomNav': (_) => const MyBottomNavigationBar(),
          },
          home: Consumer(
            builder: (_, ref, __) {
              final asyncLogin = ref.watch(loginProvider);

              return asyncLogin.when(
                loading: () =>
                    const Scaffold(body: Center(child: LoadingIndicator())),
                error: (_, __) => const LoginErrorPage(),
                data: (_) => const MyBottomNavigationBar(),
              );
            },
          ),
        );
      },
    );
  }
}
