import '../../../importer.dart';

part 'dark_mode_provider.g.dart';

/// ダークモード有効フラグのNotifierProvider
@riverpod
class DarkModeNotifier extends _$DarkModeNotifier {
  @override
  bool build() => false; // 有効フラグ

  /// 有効フラグの設定状態をtrueに更新
  // ignore: use_setters_to_change_properties
  void setSetting({required bool isDarkMode}) {
    state = isDarkMode;
  }
}
