import 'package:subrisu/importer.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: _lightAppBarTheme(),
      floatingActionButtonTheme: _floatingButtonTheme(),
      textTheme: _textTheme(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff212121),
      appBarTheme: _darkAppBarTheme(),
      floatingActionButtonTheme: _floatingButtonTheme(),
      textTheme: _textTheme(),
    );
  }

  /// AppBarのUI設定を行う
  static AppBarTheme _lightAppBarTheme() {
    return AppBarTheme(
      centerTitle: true,
      elevation: 1,
      backgroundColor: Configs.appColor,
      titleTextStyle: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  /// AppBarのUI設定を行う
  static AppBarTheme _darkAppBarTheme() {
    return AppBarTheme(
      elevation: 1,
      titleTextStyle: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  /// FloatingActionButtonのUI設定を行う
  static FloatingActionButtonThemeData _floatingButtonTheme() {
    return const FloatingActionButtonThemeData(
      elevation: 2,
      highlightElevation: 2,
      backgroundColor: Configs.appColor,
      splashColor: Colors.transparent,
    );
  }

  /// TextのUI設定を行う
  static TextTheme _textTheme() {
    return TextTheme(
      bodyText2: TextStyle(fontSize: 14.sp),
    );
  }
}
