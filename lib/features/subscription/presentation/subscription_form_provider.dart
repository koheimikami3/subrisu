import '../../../importer.dart';

part 'subscription_form_provider.g.dart';

/// SubscriptionFormのNotifierProvider
@riverpod
class SubscriptionFormNotifier extends _$SubscriptionFormNotifier {
  @override
  SubscriptionFormState build() {
    final now = DateTime.now(); // 現在の日付

    // 今月の1日から最終日までのリストを生成
    final dayList = _generateDayList(now.year, now.month);

    return SubscriptionFormState(
      dayList: dayList,
      selectedFirstPaidYear: now.year,
      selectedFirstPaidMonth: now.month,
      selectedFirstPaidDay: now.day,
      resultFirstPaidDate: DateTime(now.year, now.month, now.day),
    );
  }

  // フォームの状態を初期化する
  void initFormState({
    required String serviceName,
    required String price,
    required String iconImagePath,
    required PaymentCycle paymentCycle,
    required DateTime firstPaidOn,
    required bool isNotificationEnabled,
    required String note,
  }) {
    // 初回支払い日の年月に対応する日にちリストを生成
    final dayList = _generateDayList(firstPaidOn.year, firstPaidOn.month);

    state = state.copyWith(
      serviceName: serviceName,
      price: price,
      selectedIconImagePath: iconImagePath,
      resultIconImagePath: iconImagePath,
      paymentCycle: paymentCycle,
      dayList: dayList,
      selectedFirstPaidYear: firstPaidOn.year,
      selectedFirstPaidMonth: firstPaidOn.month,
      selectedFirstPaidDay: firstPaidOn.day,
      resultFirstPaidDate: firstPaidOn,
      isNotificationEnabled: isNotificationEnabled,
      note: note,
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

  // Pickerで選択中の初回支払い年の状態を更新する
  void setSelectedFirstPaidYear(int value) {
    state = state.copyWith(selectedFirstPaidYear: value);
    setDayList();
  }

  // Pickerで選択中の初回支払い月の状態を更新する
  void setSelectedFirstPaidMonth(int value) {
    state = state.copyWith(selectedFirstPaidMonth: value);
    setDayList();
  }

  // Pickerで選択中の初回支払い日にちの状態を更新する
  void setSelectedFirstPaidDay(int value) {
    state = state.copyWith(selectedFirstPaidDay: value);
  }

  // Pickerで選択中の初回支払い年月に対応する日にちリストの状態を更新する
  void setDayList() {
    // Pickerで選択中の初回支払い年月に対応する日にちリストを生成
    final newDayList = _generateDayList(
      state.selectedFirstPaidYear,
      state.selectedFirstPaidMonth,
    );

    // 状態を更新
    state = state.copyWith(dayList: newDayList);

    // Pickerで選択中の初回支払い日にちが、
    // 新しいdayListの長さを超えている場合は、dayListの最終日にちに設定する
    if (state.selectedFirstPaidDay >= state.dayList.length) {
      state = state.copyWith(selectedFirstPaidDay: state.dayList.length);
    }
  }

  // 選択確定初回支払い日の状態を更新する
  void setResultFirstPaidDate() {
    state = state.copyWith(
      resultFirstPaidDate: DateTime(
        state.selectedFirstPaidYear,
        state.selectedFirstPaidMonth,
        state.selectedFirstPaidDay,
      ),
    );
  }

  // 通知フラグの状態を更新する
  void setIsNotificationEnabled(bool value) {
    state = state.copyWith(isNotificationEnabled: value);
  }

  // メモの状態を更新する
  void setNote(String value) {
    state = state.copyWith(note: value);
  }

  // 年月に対応する日にちリストを生成する
  List<int> _generateDayList(int year, int month) {
    // 年月に対応する最終日を取得
    final lastDay = DateTime(year, month + 1, 0).day;

    // 1日から最終日までのリストを生成
    final dayList = List.generate(lastDay, (i) => i + 1);

    return dayList;
  }
}
