import 'constant/colors.dart' as colors;
import 'constant/configs.dart' as configs;
import 'importer.dart';

/// アプリのテーマ設定
class AppTheme {
  const AppTheme();

  /// ライトモードのテーマ設定を行う
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: colors.appColor,
      splashColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.grey.shade600),
      appBarTheme: _lightAppBarTheme(),
      bottomNavigationBarTheme: _lightBottomNavTheme(),
      floatingActionButtonTheme: _floatingButtonTheme(),
      textTheme: _lightTextTheme(),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontSize: configs.defaultFontSize.sp,
            color: colors.appColor,
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.white,
      ),
    );
  }

  /// ダークモードのテーマ設定を行う
  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: colors.appColor,
      iconTheme: IconThemeData(color: Colors.grey.shade400),
      splashColor: Colors.transparent,
      appBarTheme: _darkAppBarTheme(),
      bottomNavigationBarTheme: _darkBottomNavTheme(),
      floatingActionButtonTheme: _floatingButtonTheme(),
      textTheme: _darkTextTheme(),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontSize: configs.defaultFontSize.sp,
            color: colors.appColor,
          ),
        ),
      ),
    );
  }

  /// ライトモードAppBarのUI設定を行う
  static AppBarTheme _lightAppBarTheme() {
    return AppBarTheme(
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
      elevation: 1,
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
      selectedIconTheme: IconThemeData(size: 28.w),
      unselectedIconTheme: IconThemeData(size: 28.w),
      selectedLabelStyle: TextStyle(fontSize: 12.sp),
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
      selectedItemColor: Colors.black,
    );
  }

  /// ダークモードBottomNavigationBarのUI設定を行う
  static BottomNavigationBarThemeData _darkBottomNavTheme() {
    return BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 28.w),
      unselectedIconTheme: IconThemeData(size: 28.w),
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
    );
  }

  /// ライトモードTextのUI設定を行う
  static TextTheme _lightTextTheme() {
    return TextTheme(
      bodyMedium: TextStyle(
        fontSize: configs.defaultFontSize.sp,
        // color: Colors.black87,
      ),
    );
  }

  /// ダークモードTextのUI設定を行う
  static TextTheme _darkTextTheme() {
    return TextTheme(
      bodyMedium: TextStyle(
        fontSize: configs.defaultFontSize.sp,
        // color: Colors.white,
      ),
    );
  }
}
