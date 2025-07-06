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

    // Pickerで選択中の初回支払い年月に対応する日にちリスト
    @Default([]) List<int> dayList,

    // Pickerで選択中の初回支払い年
    required int selectedFirstPaidYear,

    // Pickerで選択中の初回支払い月
    required int selectedFirstPaidMonth,

    // Pickerで選択中の初回支払い日にち
    required int selectedFirstPaidDay,

    // 選択確定初回支払い日
    required DateTime resultFirstPaidDate,

    // メモ
    @Default('') String note,
  }) = _SubscriptionFormState;

  const SubscriptionFormState._();
}
