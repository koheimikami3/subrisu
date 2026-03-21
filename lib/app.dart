import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/app_theme.dart';
import 'package:subrisu/components/loading_indicator.dart';
import 'package:subrisu/constants/shered_preferences_keys.dart';
import 'package:subrisu/enums/language_settings.dart';
import 'package:subrisu/enums/theme_settings.dart';
import 'package:subrisu/features/login_error/login_error_page.dart';
import 'package:subrisu/features/subscription/presentation/list/subscription_list.page.dart';
import 'package:subrisu/features/user/data/login_provider.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/language_settings_provider.dart';
import 'package:subrisu/providers/purchase_status_provider.dart';
import 'package:subrisu/providers/shared_preferences_provider.dart';
import 'package:subrisu/providers/theme_settings_provider.dart';

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
    ref.read(purchaseStatusNotifierProvider.notifier).initStatus();

    // 起動回数をインクリメント
    _incrementLaunchCount();
  }

  /// 起動回数をインクリメントして保存する
  Future<void> _incrementLaunchCount() async {
    final pref = ref.read(sharedPreferencesProvider);
    var launchCount = pref.getInt(SheredPreferencesKeys.launchCount) ?? 0;
    launchCount++;
    await pref.setInt(SheredPreferencesKeys.launchCount, launchCount);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeSettingsNotifierProvider);
    final language = ref.watch(languageSettingsNotifierProvider);
    ref.watch(purchaseStatusNotifierProvider);

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, __) {
        return MaterialApp(
          theme: appThemeLight(),
          themeMode: theme == ThemeSettings.device
              ? ThemeMode.system
              : theme == ThemeSettings.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
          darkTheme: appThemeDark(),
          debugShowCheckedModeBanner: false,
          locale: language == LanguageSettings.english
              ? Locale(LanguageSettings.english.code)
              : Locale(LanguageSettings.japanese.code),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Consumer(
            builder: (_, ref, __) {
              final asyncLogin = ref.watch(loginProvider);

              return asyncLogin.when(
                loading: () =>
                    const Scaffold(body: Center(child: LoadingIndicator())),
                error: (_, __) => const LoginErrorPage(),
                data: (_) => const SubscriptionListPage(),
              );
            },
          ),
        );
      },
    );
  }
}
