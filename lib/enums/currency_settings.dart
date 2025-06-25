import 'package:intl/intl.dart';

/// 通貨設定
enum CurrencySettings {
  usd('USD', '\$', 'en_US', 2),
  jpy('JPY', '¥', 'ja_JP', 0),
  eur('EUR', '€', 'de_DE', 2),
  gbp('GBP', '£', 'en_GB', 2),
  cny('CNY', '¥', 'zh_CN', 2),
  inr('INR', '₹', 'hi_IN', 2),
  cad('CAD', 'C\$', 'en_CA', 2),
  aud('AUD', 'A\$', 'en_AU', 2),
  krw('KRW', '₩', 'ko_KR', 0);

  const CurrencySettings(
    this.code,
    this.symbol,
    this.locale,
    this.decimalDigits,
  );

  final String code;
  final String symbol;
  final String locale;
  final int decimalDigits;

  /// NumberFormat.currency用のフォーマッターを取得
  NumberFormat get formatter => NumberFormat.currency(
        locale: locale,
        symbol: symbol,
        decimalDigits: decimalDigits,
      );

  /// 金額をフォーマットして文字列で返す
  String formatAmount(double amount) => formatter.format(amount);

  /// 通貨コードから対応するCurrencySettingsを取得
  static CurrencySettings fromCode(String code) {
    return CurrencySettings.values.firstWhere(
      (currency) => currency.code.toLowerCase() == code.toLowerCase(),
    );
  }
}
