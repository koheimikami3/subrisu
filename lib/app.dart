import 'package:subrisu/importer.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) {
        return MaterialApp(
          theme: isDark ? AppTheme.darkTheme() : AppTheme.lightTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/login': (_) => const LoginPage(),
            '/settings': (_) => const SettingsPage(),
            '/darkMode': (_) => const DarkModePage(),
            '/bottomNav': (_) => const BottomNavBar(),
          },
          home: const BottomNavBar(),
        );
      },
    );
  }
}
