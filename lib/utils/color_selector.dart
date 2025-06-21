import '../importer.dart';

/// テーマ設定に応じた色を返す
Color? selectColor({
  required BuildContext context,
  required ThemeSettings themeSettings,
  required Color? lightColor,
  required Color? darkColor,
}) {
  if (themeSettings == ThemeSettings.device) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    if (brightness == Brightness.dark) {
      return darkColor;
    } else {
      return lightColor;
    }
  } else if (themeSettings == ThemeSettings.light) {
    return lightColor;
  } else {
    return darkColor;
  }
}
