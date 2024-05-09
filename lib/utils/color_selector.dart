import '../importer.dart';

/// テーマ設定に応じた色を返す
Color? selectColor({
  required BuildContext context,
  required ThemeSetting themeSetting,
  required Color? lightColor,
  required Color? darkColor,
}) {
  if (themeSetting == ThemeSetting.device) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    if (brightness == Brightness.dark) {
      return darkColor;
    } else {
      return lightColor;
    }
  } else if (themeSetting == ThemeSetting.light) {
    return lightColor;
  } else {
    return darkColor;
  }
}
