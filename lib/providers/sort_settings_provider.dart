import 'dart:async';

import '../../../importer.dart';

part 'sort_settings_provider.g.dart';

/// サブスクリプションリストの並び替え設定を管理するNotifierProvider
@riverpod
class SortSettingsNotifier extends _$SortSettingsNotifier {
  @override
  SortSettings build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // 並び替えの設定状況を取得
    // 未設定の場合、次回支払日までの日数を基準に昇順に設定
    final sortIndex = prefs.getInt(AppConfigs.subscriptionListSortKey) ??
        SortSettings.ascendingNextPaymentDays.index;

    return SortSettings.values[sortIndex];
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
