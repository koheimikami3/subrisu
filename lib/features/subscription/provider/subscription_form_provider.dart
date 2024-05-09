import '../../../importer.dart';

part 'subscription_form_provider.g.dart';

/// SubscriptionFormのNotifierProvider
@riverpod
class SubscriptionFormNotifier extends _$SubscriptionFormNotifier {
  @override
  SubscriptionFormState build() => const SubscriptionFormState();

  // フォームの状態を初期化する
  void initFormState({
    required String serviceName,
    required String price,
    required String iconImagePath,
    required PaymentCycle paymentCycle,
    required DateTime firstPaidOn,
    required bool notification,
    required String memo,
  }) {
    state = state.copyWith(
      serviceName: serviceName,
      price: price,
      selectedIconImagePath: iconImagePath,
      resultIconImagePath: iconImagePath,
      paymentCycle: paymentCycle,
      firstPaidYear: firstPaidOn.year,
      firstPaidMonth: firstPaidOn.month,
      firstPaidDay: firstPaidOn.day,
      notification: notification,
      memo: memo,
    );
  }

  // サービス名の状態を更新する
  void setServiceName(String value) {
    state = state.copyWith(serviceName: value);
  }

  // 価格の状態を更新する
  void setPrice(String value) {
    state = state.copyWith(price: value);
  }

  // 選択中アイコン画像パスの状態を更新する
  void setSelectedIconImagePath(String value) {
    state = state.copyWith(selectedIconImagePath: value);
  }

  // 選択確定アイコン画像パスの状態を更新する
  void setResultIconImagePath(String value) {
    state = state.copyWith(resultIconImagePath: value);
  }

  // 支払い周期の状態を更新する
  void setPaymentCycle(PaymentCycle value) {
    state = state.copyWith(paymentCycle: value);
  }

  // 初回支払い年の状態を更新する
  void setFirstPaidYear(int value) {
    state = state.copyWith(firstPaidYear: value);
  }

  // 初回支払い月の状態を更新する
  void setFirstPaidMonth(int value) {
    state = state.copyWith(firstPaidMonth: value);
  }

  // 初回支払い日の状態を更新する
  void setFirstPaidDay(int value) {
    state = state.copyWith(firstPaidDay: value);
  }

  // 通知フラグの状態を更新する
  void setNotification(bool value) {
    state = state.copyWith(notification: value);
  }

  // メモの状態を更新する
  void setMemo(String value) {
    state = state.copyWith(memo: value);
  }
}
