import '../../../importer.dart';

part 'subscription_form_state.freezed.dart';

/// SubscriptionFormのState
@freezed
abstract class SubscriptionFormState implements _$SubscriptionFormState {
  const factory SubscriptionFormState({
    // サービス名
    @Default('') String serviceName,

    // 価格
    @Default('') String price,

    // 選択中アイコン画像パス
    @Default('') String selectedIconImagePath,

    // 選択確定アイコン画像パス
    @Default('') String resultIconImagePath,

    // 支払い周期
    @Default(PaymentCycle.monthly) PaymentCycle paymentCycle,

    // 初回支払い年
    @Default(null) int? firstPaidYear,

    // 初回支払い月
    @Default(null) int? firstPaidMonth,

    // 初回支払い日
    @Default(null) int? firstPaidDay,

    // 通知を有効にするかどうか
    @Default(false) bool isNotificationEnabled,

    // メモ
    @Default('') String note,

    // 作成日時
    @Default(null) DateTime? createdAt,
  }) = _SubscriptionFormState;

  const SubscriptionFormState._();
}
