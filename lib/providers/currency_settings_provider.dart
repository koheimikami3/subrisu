import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/shered_preferences_keys.dart';
import 'package:subrisu/enums/currency_settings.dart';
import 'package:subrisu/enums/language_settings.dart';
import 'package:subrisu/providers/shared_preferences_provider.dart';

part 'currency_settings_provider.g.dart';

/// アプリケーションの通貨設定を管理するNotifierProvider
@riverpod
class CurrencySettingsNotifier extends _$CurrencySettingsNotifier {
  @override
  CurrencySettings build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // 通貨コードの設定状況を取得
    final currencyCode = prefs.getString(SheredPreferencesKeys.currencyCode);

    // 通貨コードが未設定の場合、
    // 言語設定が日本語ならJPY、英語ならUSDを初期値に設定
    if (currencyCode == null) {
      if (WidgetsBinding.instance.platformDispatcher.locale.languageCode ==
          LanguageSettings.japanese.code) {
        return CurrencySettings.jpy;
      }

      return CurrencySettings.usd;
    }

    return CurrencySettings.fromCode(currencyCode);
  }

  /// 状態を指定したCurrencySettingsに更新
  ///
  /// 通貨コードをSharedPreferencesに保存
  void set(CurrencySettings value) {
    final prefs = ref.read(sharedPreferencesProvider);

    state = value;
    prefs.setString(SheredPreferencesKeys.currencyCode, value.code);
  }
}
