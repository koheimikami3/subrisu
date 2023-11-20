// import 'package:flutter/cupertino.dart';

import 'package:subrisu/view/list/widget/sort_button.dart';

import '../../importer.dart';

/// リスト画面
class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  @override
  void initState() {
    super.initState();

    // 例外が発生しないように画面描画後に処理を実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 強制アップデート対象の場合、ダイアログを表示
      AppManager.checkForceAppVersion(context);

      // 初回起動の場合、広告トラッキング設定ダイアログを表示
      AppManager.showAppTrackingTransparency();

      // アップデート内容表示対象の場合、ダイアログを表示
      // 次バージョン以降で実装
      // 何度も表示されないようにする
      // AppManager.checkUpdateContents(context);

      // 初回起動の場合、プッシュ通知設定ダイアログを表示
      AppManager.checkNotificationSetting();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isUserLoaded = ref.watch(isUserLoadedProvider);
    final loginError = ref.watch(loginErrorProvider);

    return Scaffold(
      appBar: AppBar(
        title: _title(),
        automaticallyImplyLeading: false,
        actions: const [SortButton()],
      ),
      floatingActionButton: loginError ? null : const CreatePageButton(),
      body: loginError
          ? Center(child: _loginError())
          : !isUserLoaded
              ? const Center(child: LoadingIndicator())
              : const SubscriptionList(),
    );
  }

  /// AppBarタイトル
  Widget _title() {
    final subscriptionDocList = ref.watch(subscriptionViewModelProvider);
    var totalPrice = 0;

    for (final doc in subscriptionDocList) {
      final data = doc.data()! as Map<String, dynamic>;
      final paymentCycle = data['paymentCycle'] as int;
      final price = int.parse(data['price'] as String);

      // 現在日付を取得
      var now = DateTime.now();
      now = DateTime(now.year, now.month, now.day);

      // 初回支払日を取得
      final timestamp = data['firstPaidOn'] as Timestamp;
      final firstPaidOn = timestamp.toDate();

      // 今月の1日の日付を取得
      final firstDay = DateTime(now.year, now.month, 1);

      // 今月の最終日の日付を取得
      final lastDay = DateTime(now.year, now.month + 1, 0);

      switch (paymentCycle) {
        // 「毎日」の場合
        case 0:
          var dateTime = firstDay;

          // 今月の日数分料金を加算
          for (var i = 0; i < lastDay.day; i++) {
            totalPrice += price;
          }

          // 今月加入したサービスの場合、
          // 加入前の日数分料金を引く
          while (dateTime.isBefore(firstPaidOn)) {
            dateTime = DateTime(
              dateTime.year,
              dateTime.month,
              dateTime.day + 1,
            );
            totalPrice -= price;
          }
          break;

        // 「毎週」の場合
        case 1:
          // 今月の週数を計算
          final weeksInMonth =
              ((lastDay.difference(firstDay).inDays) / 7).ceil();

          // 今月の週数分料金を加算
          for (var i = 0; i < weeksInMonth; i++) {
            totalPrice += price;
          }

          break;

        // 「毎月」の場合
        case 2:
          totalPrice += price;
          break;

        // 「3ヶ月」の場合
        case 3:
          totalPrice += price ~/ 3;
          break;

        // 「6ヶ月」の場合
        case 4:
          totalPrice += price ~/ 6;
          break;

        // 「毎年」の場合
        case 5:
          totalPrice += price ~/ 12;
      }
    }

    final text = '今月の合計：¥$totalPrice';

    return Text(text);
  }

  /// ログインエラーのテキスト
  Widget _loginError() {
    const text = 'ログインに失敗しました。\n時間をおいて再度お試しください。';

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15.sp,
        color: Colors.red,
      ),
    );
  }
}
