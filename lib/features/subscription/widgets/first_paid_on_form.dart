import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../importer.dart';

/// 利用開始日フォームを表示する
class FirstPaidOnForm extends ConsumerStatefulWidget {
  const FirstPaidOnForm({
    super.key,
    this.firstPaidOn,
  });

  final DateTime? firstPaidOn;

  @override
  ConsumerState<FirstPaidOnForm> createState() => _FirstPaidOnFormState();
}

class _FirstPaidOnFormState extends ConsumerState<FirstPaidOnForm> {
  late int _selectedYear;
  late int _selectedMonth;
  late int _selectedDay;
  late final List<int> _yearList = [];
  late final List<int> _monthList = [];
  late final List<int> _dayList = [];

  // final _thirtyDayList = [4, 6, 9, 11];

  @override
  void initState() {
    super.initState();
    late DateTime datetime;

    // 年月日リストを作成
    for (var i = 1990; i < 2031; i++) {
      _yearList.add(i);
    }
    for (var i = 1; i < 13; i++) {
      _monthList.add(i);
    }
    for (var i = 1; i < 32; i++) {
      _dayList.add(i);
    }

    // 初期値を作成
    if (widget.firstPaidOn != null) {
      datetime = widget.firstPaidOn!;
    } else {
      datetime = DateTime.now();
    }
    _selectedYear = _yearList.indexOf(datetime.year);
    _selectedMonth = _monthList.indexOf(datetime.month);
    _selectedDay = _dayList.indexOf(datetime.day);
  }

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: AppLocalizations.of(context)!.firstPaymentDateTitle,
      content: _selectButton(),
    );
  }

  Widget _selectButton() {
    final formState = ref.watch(subscriptionFormNotifierProvider);
    late final DateTime dateTime;

    if (formState.firstPaidYear == null) {
      dateTime = DateTime.now();
    } else {
      dateTime = DateTime(
        formState.firstPaidYear!,
        formState.firstPaidMonth!,
        formState.firstPaidDay!,
      );
    }

    return GestureDetector(
      onTap: _onTap,
      child: Row(
        children: [
          Text(AppLocalizations.of(context)!.firstPaidOn(dateTime)),
          Icon(
            Icons.unfold_more,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }

  /// 利用開始日を選択するPickerを呼び出す
  void _onTap() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) {
        return CupertinoPickerSheet(
          picker: Localizations.localeOf(context) == const Locale('en')
              ? Row(
                  children: [
                    Expanded(child: _monthPicker(context)),
                    Expanded(child: _datePicker(context)),
                    Expanded(child: _yearPicker(context)),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: _yearPicker(context)),
                    Expanded(child: _monthPicker(context)),
                    Expanded(child: _datePicker(context)),
                  ],
                ),
          saveOnPressed: _saveOnPressed,
        );
      },
    );
  }

  /// 変更内容をプロバイダに保存し、画面に反映する
  void _saveOnPressed() {
    // 選択した年月日を取得
    final year = _yearList[_selectedYear];
    final month = _monthList[_selectedMonth];
    final day = _dayList[_selectedDay];

    // 選択内容をプロバイダに保存
    ref.read(subscriptionFormNotifierProvider.notifier)
      ..setFirstPaidYear(year)
      ..setFirstPaidMonth(month)
      ..setFirstPaidDay(day);

    // Pickerを閉じる
    Navigator.pop(context);
  }

  /// 年を選択するPicker
  Widget _yearPicker(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: _selectedYear,
      ),
      onSelectedItemChanged: (value) {
        _selectedYear = value;
      },
      children: [
        for (int i = 0; i < _yearList.length; i++) ...{
          Center(
            child: Text(
              Localizations.localeOf(context) == const Locale('en')
                  ? '${_yearList[i]}'
                  : '${_yearList[i]}年',
            ),
          ),
        },
      ],
    );
  }

  /// 月を選択するPicker
  Widget _monthPicker(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: _selectedMonth,
      ),
      onSelectedItemChanged: (value) {
        _selectedMonth = value;
      },
      children: [
        for (int i = 0; i < _monthList.length; i++) ...{
          Center(
            child: Text(
              Localizations.localeOf(context) == const Locale('en')
                  ? DateFormat.MMMM()
                      .format(DateTime(_yearList[i], _monthList[i]))
                  : '${_monthList[i]}月',
            ),
          ),
        },
      ],
    );
  }

  /// 日を選択するPicker
  Widget _datePicker(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: _selectedDay,
      ),
      onSelectedItemChanged: (value) {
        _selectedDay = value;
      },
      children: [
        for (int i = 0; i < _dayList.length; i++) ...{
          Center(
            child: Text(
              Localizations.localeOf(context) == const Locale('en')
                  ? '${_dayList[i]}'
                  : '${_dayList[i]}日',
            ),
          ),
        },
      ],
    );
  }
}
