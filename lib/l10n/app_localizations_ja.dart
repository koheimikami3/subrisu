// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get createSubscriptionPageTitle => '新規登録';

  @override
  String get editSubscriptionPageTitle => '編集';

  @override
  String get settingsPageTitle => '設定';

  @override
  String get purchasePageTitle => '広告の非表示';

  @override
  String get notificationSettingsPageTitle => '通知設定';

  @override
  String get themeSettingsPageTitle => 'テーマ設定';

  @override
  String get languageSettingsPageTitle => '言語設定';

  @override
  String get currencySettingsPageTitle => '通貨設定';

  @override
  String get loginErrorPageTitle => 'ログインエラー';

  @override
  String get saveIconButton => '保存';

  @override
  String get pickerSaveButton => '完了';

  @override
  String get createSubscriptionButton => '登録';

  @override
  String get updateSubscriptionButton => '更新';

  @override
  String get openStoreUrlButton => 'アップデート';

  @override
  String get closeDialogButton => '閉じる';

  @override
  String get cancelButton => 'キャンセル';

  @override
  String get serviceInfoTitle => 'サービス情報';

  @override
  String get iconSelectDialogTitle => 'アイコン選択';

  @override
  String get detailInfoTitle => '詳細情報';

  @override
  String get paymentCycleTitle => '支払い周期';

  @override
  String get firstPaymentDateTitle => '初回支払い日';

  @override
  String firstPaidOn(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String firstPaidYear(int year) {
    return '$year年';
  }

  @override
  String firstPaidMonth(String month) {
    String _temp0 = intl.Intl.selectLogic(
      month,
      {
        '1': '1月',
        '2': '2月',
        '3': '3月',
        '4': '4月',
        '5': '5月',
        '6': '6月',
        '7': '7月',
        '8': '8月',
        '9': '9月',
        '10': '10月',
        '11': '11月',
        '12': '12月',
        'other': '不明な月',
      },
    );
    return '$_temp0';
  }

  @override
  String firstPaidDay(int day) {
    return '$day日';
  }

  @override
  String daysLeft(int day) {
    return 'あと$day日';
  }

  @override
  String get memoFormTitle => 'メモ';

  @override
  String get serviceNameHint => 'サービス名*';

  @override
  String get priceHint => '料金*';

  @override
  String get deleteSubscriptionDialogContent => 'データを削除してもよろしいですか？';

  @override
  String get deleteSubscriptionButton => '削除';

  @override
  String get purchaseItemsTitle => '有料プラン';

  @override
  String get appSettingsTitle => 'アプリ';

  @override
  String get supportItemsTitle => 'サポート';

  @override
  String get appVersionTitle => 'バージョン';

  @override
  String get purchaseItem => '広告の非表示';

  @override
  String get notificationItem => '通知設定';

  @override
  String get themeItem => 'テーマ設定';

  @override
  String get languageItem => '言語設定';

  @override
  String get currencyItem => '通貨設定';

  @override
  String get reviewItem => 'レビューを書く';

  @override
  String get shareItem => 'アプリをシェアする';

  @override
  String shareText(String storeUrl) {
    return 'サブリス - サブスクと固定費をリストで管理\n$storeUrl';
  }

  @override
  String get inquiryItem => 'お問い合わせ';

  @override
  String get termsOfServiceItem => '利用規約';

  @override
  String get privacyPolicyItem => 'プライバシーポリシー';

  @override
  String get appVersionItem => 'アプリのバージョン';

  @override
  String get removeAdsItem => '広告を非表示にする';

  @override
  String get restoreItem => '購入を復元する';

  @override
  String get subscriptionListNavi => 'リスト';

  @override
  String get settingsNavi => '設定';

  @override
  String get errorDialogTitle => 'エラー';

  @override
  String get restoreCompletedDialogContent => '復元が完了しました。';

  @override
  String get loginError => 'ログインに失敗しました。\n時間をおいて再度お試しください。';

  @override
  String get fetchSubscriptionsError => 'サブスクリプションの取得に失敗しました。\n時間をおいて再度お試しください。';

  @override
  String get createSubscriptionError => 'サブスクリプションデータを登録できませんでした。時間をおいて再度お試しください。';

  @override
  String get updateSubscritpionError => 'サブスクリプションデータを更新できませんでした。時間をおいて再度お試しください。';

  @override
  String get deleteSubscriptionError => 'サブスクリプションデータを削除できませんでした。時間をおいて再度お試しください。';

  @override
  String get noPurchaseItemError => '購入可能なアイテムが見つかりませんでした。';

  @override
  String get noPurchaseInfoError => '過去の購入情報が見つかりませんでした。購入を行ったアカウントをご確認ください。';

  @override
  String get openReviewError => 'レビュー画面を開けませんでした。';

  @override
  String get purchaseError => '購入処理を完了できませんでした。';

  @override
  String get restoreError => '復元処理を完了できませんでした。';

  @override
  String get openUrlError => '指定されたURLのページを開けませんでした。';

  @override
  String get noSubscription => 'サブスクリプションはありません\n右下の＋ボタンで登録できます';

  @override
  String get sortPullDownTitle => '並び替え';

  @override
  String get today => '今日';

  @override
  String get alreadyPurchased => '購入済み';

  @override
  String get purchaseNotice => '広告の非表示は買い切りです。';

  @override
  String get total => '今月';

  @override
  String get confirmationDialogTitle => '確認';

  @override
  String get forcedUpdateDialogTitle => 'アップデートのお知らせ';

  @override
  String forcedUpdateDialogContent(String version) {
    return '新しいバージョンのアプリが利用可能です。今すぐバージョン$versionにアップデートしてください。';
  }

  @override
  String get updateContentsDialogTitle => 'アップデート内容';

  @override
  String newVersion(String newVersion) {
    return 'バージョン$newVersion';
  }

  @override
  String get thankYouMessage => '引き続きサブリスをよろしくお願いします。';

  @override
  String get reminder => '支払いのリマインド通知';

  @override
  String get reminderDaysBeforeTitle => '日にち';

  @override
  String reminderDaysBefore(String days) {
    String _temp0 = intl.Intl.selectLogic(
      days,
      {
        '0': '当日',
        'other': '$days日前',
      },
    );
    return '$_temp0';
  }

  @override
  String get reminderHourTitle => '時間';

  @override
  String get notificationNoticePrefix => '通知を受け取るには、';

  @override
  String get notificationNoticeSettings => '端末の通知設定';

  @override
  String get notificationNoticeSuffix => 'をオンにしてください。';

  @override
  String theme(String theme) {
    String _temp0 = intl.Intl.selectLogic(
      theme,
      {
        'device': '端末設定と同じ',
        'light': 'ライトモード',
        'dark': 'ダークモード',
        'other': 'error',
      },
    );
    return '$_temp0';
  }

  @override
  String language(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'japanese': '日本語',
        'english': 'English',
        'other': 'error',
      },
    );
    return '$_temp0';
  }

  @override
  String sort(String sort) {
    String _temp0 = intl.Intl.selectLogic(
      sort,
      {
        'nextPaymentAsc': '支払い日が近い順',
        'priceAsc': '料金が安い順',
        'priceDesc': '料金が高い順',
        'serviceNameAsc': '名前順（昇順）',
        'serviceNameDesc': '名前順（降順）',
        'other': 'error',
      },
    );
    return '$_temp0';
  }

  @override
  String paymentCycle(String paymentCycle) {
    String _temp0 = intl.Intl.selectLogic(
      paymentCycle,
      {
        'daily': '毎日',
        'weekly': '毎週',
        'biweekly': '隔週',
        'monthly': '毎月',
        'quarterly': '3ヶ月',
        'semiAnnual': '6ヶ月',
        'yearly': '毎年',
        'other': 'error',
      },
    );
    return '$_temp0';
  }

  @override
  String currency(String currency) {
    String _temp0 = intl.Intl.selectLogic(
      currency,
      {
        'USD': '(\$) 米ドル',
        'JPY': '(¥) 日本円',
        'EUR': '(€) ユーロ',
        'GBP': '(£) 英ポンド',
        'CNY': '(¥) 中国元',
        'INR': '(₹) インドルピー',
        'CAD': '(C\$) カナダドル',
        'AUD': '(A\$) 豪ドル',
        'KRW': '(₩) 韓国ウォン',
        'other': '不明な通貨',
      },
    );
    return '$_temp0';
  }
}
