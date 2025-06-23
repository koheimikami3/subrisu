import 'importer.dart';

/// ライトモードのテーマ設定を行う
ThemeData appThemeLight() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: Colors.grey.shade50,
    splashColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.grey.shade600),
    appBarTheme: _lightAppBarTheme(),
    bottomNavigationBarTheme: _lightBottomNavTheme(),
    floatingActionButtonTheme: _floatingButtonTheme(),
    textTheme: _lightTextTheme(),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: AppConfigs.defaultFontSize.sp,
          color: AppColors.primary,
        ),
      ),
    ),
    dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary),
  );
}

/// ダークモードのテーマ設定を行う
ThemeData appThemeDark() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primary,
    iconTheme: IconThemeData(color: Colors.grey.shade400),
    splashColor: Colors.transparent,
    appBarTheme: _darkAppBarTheme(),
    bottomNavigationBarTheme: _darkBottomNavTheme(),
    floatingActionButtonTheme: _floatingButtonTheme(),
    textTheme: _darkTextTheme(),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: AppConfigs.defaultFontSize.sp,
          color: AppColors.primary,
        ),
      ),
    ),
  );
}

/// ライトモードAppBarのUI設定を行う
AppBarTheme _lightAppBarTheme() {
  return AppBarTheme(
    backgroundColor: AppColors.primary,
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
BottomNavigationBarThemeData _lightBottomNavTheme() {
  return BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(size: 28.w),
    unselectedIconTheme: IconThemeData(size: 28.w),
    selectedLabelStyle: TextStyle(fontSize: 12.sp),
    unselectedLabelStyle: TextStyle(fontSize: 12.sp),
    selectedItemColor: Colors.black,
  );
}

/// ダークモードBottomNavigationBarのUI設定を行う
BottomNavigationBarThemeData _darkBottomNavTheme() {
  return BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(size: 28.w),
    unselectedIconTheme: IconThemeData(size: 28.w),
    selectedLabelStyle: TextStyle(fontSize: 12.sp),
    unselectedLabelStyle: TextStyle(fontSize: 12.sp),
    selectedItemColor: AppColors.primary,
  );
}

/// FloatingActionButtonのUI設定を行う
FloatingActionButtonThemeData _floatingButtonTheme() {
  return const FloatingActionButtonThemeData(
    elevation: 2,
    highlightElevation: 2,
    backgroundColor: AppColors.primary,
  );
}

/// ライトモードTextのUI設定を行う
TextTheme _lightTextTheme() {
  return TextTheme(
    bodyMedium: TextStyle(
      fontSize: AppConfigs.defaultFontSize.sp,
      // color: Colors.black87,
    ),
  );
}

/// ダークモードTextのUI設定を行う
TextTheme _darkTextTheme() {
  return TextTheme(
    bodyMedium: TextStyle(fontSize: AppConfigs.defaultFontSize.sp),
  );
}
