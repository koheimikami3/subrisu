import '../../../importer.dart';
import '../constants/configs.dart' as configs;

part 'sort_settings_provider.g.dart';

/// サブスクリプションリストの並び替え設定を管理するNotifierProvider
@riverpod
class SortSettingsNotifier extends _$SortSettingsNotifier {
  @override
  SortSettings build() {
    final index =
        ref.read(sharedPreferencesProvider).getInt(configs.listSortKey) ?? 0;

    return SortSettings.values[index];
  }

  /// 設定の状態を更新
  // ignore: use_setters_to_change_properties
  void setSettings(SortSettings value) {
    state = value;
  }
}
