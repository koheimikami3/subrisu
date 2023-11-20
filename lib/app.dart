import 'package:flutter/cupertino.dart';
import 'importer.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    super.key,
    required this.user,
  });

  final User? user; // Firebaseにサインインしているユーザー

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    // 購入処理機能を初期化し、課金状況をアプリに反映
    AppManager.initPurchases(ref);

    // ログインする
    // 例外発生時のプロバイダ処理を正常に行うため、
    // 画面描画後に処理を実行
    WidgetsBinding.instance.addPostFrameCallback((_) => login());
  }

  /// アプリの使用に必要なユーザーデータを取得する
  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    final messaging = FirebaseMessaging.instance;
    final userRepository = ref.read(userViewModelProvider.notifier);
    final subscriptionRepository =
        ref.read(subscriptionViewModelProvider.notifier);

    try {
      // Firebaseにサインインしていない場合
      if (widget.user == null) {
        // 匿名サインインを実施
        final credential = await auth.signInAnonymously();

        // 結果から認証IDを取得
        final userId = credential.user!.uid;

        // UserDocumentを作成
        // 認証IDをドキュメントIDとする
        await userRepository.create(userId);
      }

      // Firebaseにサインインしている場合、
      // UserDocumentを取得
      if (widget.user != null) {
        await userRepository.getUser(auth.currentUser!.uid);
      }
    } on Exception {
      // リスト画面にログインエラーメッセージを表示
      ref.read(loginErrorProvider.notifier).state = true;
      return;
    }

    // SubscriptionStreamの取得を開始
    subscriptionRepository.getSubscriptions();

    // UserDocumentと端末のFCMTokenを取得
    final userToken = ref.read(userViewModelProvider).token;
    final deviceToken = await messaging.getToken();

    // Tokenが一致しない場合、UserDocumentのtokenを更新
    if (userToken != deviceToken) {
      userRepository.updateToken(deviceToken!);
    }

    // Tokenが何らかの原因で更新された場合、UserDocumentのtokenを更新
    messaging.onTokenRefresh.listen(userRepository.updateToken);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(darkModeProvider);

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, __) {
        return MaterialApp(
          theme: isDark ? AppTheme.dark() : AppTheme.light(),
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
            '/tos': (_) => const TosPage(),
            '/privacyPolicy': (_) => const PrivacyPolicyPage(),
            '/bottomNav': (_) => const BottomNavBar(),
          },
          home: const BottomNavBar(),
        );
      },
    );
  }
}
