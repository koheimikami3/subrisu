import 'dart:async';

import '../../../importer.dart';

part 'sort_settings_provider.g.dart';

/// サブスクリプションリストの並び替え設定を管理するNotifierProvider
@riverpod
class SortSettingsNotifier extends _$SortSettingsNotifier {
  @override
  SortSettings build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final index = prefs.getInt(AppConfigs.subscriptionListSortKey) ?? 0;

    return SortSettings.values[index];
  }

  /// 設定の状態を更新
  ///
  /// 並び替え設定をSharedPreferencesに保存
  void setSortSettings(SortSettings value) {
    final prefs = ref.read(sharedPreferencesProvider);
    state = value;
    unawaited(prefs.setInt(AppConfigs.subscriptionListSortKey, value.index));
  }
}
