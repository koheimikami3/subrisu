import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subrisu/enums/theme_settings.dart';
import 'package:subrisu/utils/color_selector.dart';

void main() {
  /// 指定したテーマ設定・端末の明るさでselectColorを実行し、結果を返す
  Future<Color?> resolveColor(
    WidgetTester tester, {
    required ThemeSettings themeSettings,
    required Brightness platformBrightness,
  }) async {
    Color? result;

    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(platformBrightness: platformBrightness),
        child: Builder(
          builder: (context) {
            result = selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.white,
              darkColor: Colors.black,
            );
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    return result;
  }

  group('selectColor', () {
    testWidgets('端末モードでは端末の明るさに追従する', (tester) async {
      expect(
        await resolveColor(
          tester,
          themeSettings: ThemeSettings.device,
          platformBrightness: Brightness.light,
        ),
        Colors.white,
      );
      expect(
        await resolveColor(
          tester,
          themeSettings: ThemeSettings.device,
          platformBrightness: Brightness.dark,
        ),
        Colors.black,
      );
    });

    testWidgets('ライトモードでは端末の明るさに関わらずlightColorを返す',
        (tester) async {
      expect(
        await resolveColor(
          tester,
          themeSettings: ThemeSettings.light,
          platformBrightness: Brightness.dark,
        ),
        Colors.white,
      );
    });

    testWidgets('ダークモードでは端末の明るさに関わらずdarkColorを返す',
        (tester) async {
      expect(
        await resolveColor(
          tester,
          themeSettings: ThemeSettings.dark,
          platformBrightness: Brightness.light,
        ),
        Colors.black,
      );
    });
  });
}
