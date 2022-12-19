import 'constant/colors.dart' as colors;
import 'importer.dart';

class AppTheme {
  /// ライトモードのテーマ設定を行う
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: colors.lightBackgroundColor,
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black54),
      appBarTheme: _lightAppBarTheme(),
      bottomNavigationBarTheme: _lightBottomNavTheme(),
      floatingActionButtonTheme: _floatingButtonTheme(),
      textTheme: _lightTextTheme(),
    );
  }

  /// ダークモードのテーマ設定を行う
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colors.darkBackgroundColor,
      iconTheme: const IconThemeData(color: Colors.white),
      splashColor: Colors.transparent,
      appBarTheme: _darkAppBarTheme(),
      bottomNavigationBarTheme: _darkBottomNavTheme(),
      floatingActionButtonTheme: _floatingButtonTheme(),
      textTheme: _darkTextTheme(),
    );
  }

  /// ライトモードAppBarのUI設定を行う
  static AppBarTheme _lightAppBarTheme() {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colors.appColor,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  /// ダークモードAppBarのUI設定を行う
  static AppBarTheme _darkAppBarTheme() {
    return AppBarTheme(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  /// ライトモードBottomNavigationBarのUI設定を行う
  static BottomNavigationBarThemeData _lightBottomNavTheme() {
    return BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 30),
      selectedLabelStyle: TextStyle(fontSize: 12.sp),
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
      selectedItemColor: Colors.black,
    );
  }

  /// ダークモードBottomNavigationBarのUI設定を行う
  static BottomNavigationBarThemeData _darkBottomNavTheme() {
    return BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 30),
      selectedLabelStyle: TextStyle(fontSize: 12.sp),
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
      selectedItemColor: colors.appColor,
    );
  }

  /// FloatingActionButtonのUI設定を行う
  static FloatingActionButtonThemeData _floatingButtonTheme() {
    return const FloatingActionButtonThemeData(
      elevation: 2,
      highlightElevation: 2,
      backgroundColor: colors.appColor,
      splashColor: Colors.transparent,
    );
  }

  /// ライトモードTextのUI設定を行う
  static TextTheme _lightTextTheme() {
    return TextTheme(
      bodyText2: TextStyle(fontSize: 14.sp),
    );
  }

  /// ダークモードTextのUI設定を行う
  static TextTheme _darkTextTheme() {
    return TextTheme(
      bodyText2: TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
      ),
    );
  }
}
