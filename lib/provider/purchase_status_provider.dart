import 'package:subrisu/enums/purchase_status.dart';

import '../../../importer.dart';

part 'purchase_status_provider.g.dart';

/// 画面テーマ設定のNotifierProvider
@riverpod
class PurchaseStatusNotifier extends _$PurchaseStatusNotifier {
  @override
  PurchaseStatus build() => PurchaseStatus.inactive;

  /// 購入ステータスの状態をactiveに更新
  void active() {
    state = PurchaseStatus.active;
  }
}
