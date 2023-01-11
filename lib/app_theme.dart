import 'constant/colors.dart' as colors;
import 'constant/configs.dart' as configs;
import 'importer.dart';

class AppTheme {
  /// ライトモードのテーマ設定を行う
  ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: colors.lightBackgroundColor,
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Color.fromARGB(137, 234, 153, 153)),
      appBarTheme: _lightAppBarTheme(),
      bottomNavigationBarTheme: _lightBottomNavTheme(),
      floatingActionButtonTheme: _floatingButtonTheme(),
      textTheme: _lightTextTheme(),
    );
  }

  /// ダークモードのテーマ設定を行う
  ThemeData darkTheme() {
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
  AppBarTheme _lightAppBarTheme() {
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
  AppBarTheme _darkAppBarTheme() {
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
  BottomNavigationBarThemeData _lightBottomNavTheme() {
    return BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 30),
      selectedLabelStyle: TextStyle(fontSize: 12.sp),
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
      selectedItemColor: Colors.black,
    );
  }

  /// ダークモードBottomNavigationBarのUI設定を行う
  BottomNavigationBarThemeData _darkBottomNavTheme() {
    return BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 30),
      selectedLabelStyle: TextStyle(fontSize: 12.sp),
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
      selectedItemColor: colors.appColor,
    );
  }

  /// FloatingActionButtonのUI設定を行う
  FloatingActionButtonThemeData _floatingButtonTheme() {
    return const FloatingActionButtonThemeData(
      elevation: 2,
      highlightElevation: 2,
      backgroundColor: colors.appColor,
      splashColor: Colors.transparent,
    );
  }

  /// ライトモードTextのUI設定を行う
  TextTheme _lightTextTheme() {
    return TextTheme(
      bodyText2: TextStyle(fontSize: configs.defaultFontSize.sp),
    );
  }

  /// ダークモードTextのUI設定を行う
  TextTheme _darkTextTheme() {
    return TextTheme(
      bodyText2: TextStyle(
        fontSize: configs.defaultFontSize.sp,
        color: Colors.white,
      ),
    );
  }
}
