import '../../../importer.dart';
import '../constants/configs.dart' as configs;

part 'sort_settings_provider.g.dart';

/// サブスクリプションの並び替え設定のNotifierProvider
@riverpod
class SortSettingsNotifier extends _$SortSettingsNotifier {
  @override
  SortSetting build() {
    final index =
        ref.read(sharedPreferencesProvider).getInt(configs.listSortKey) ?? 0;

    return SortSetting.values[index];
  }

  /// 設定の状態を更新
  // ignore: use_setters_to_change_properties
  void setSetting(SortSetting value) {
    state = value;
  }
}
