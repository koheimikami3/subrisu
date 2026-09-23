// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get createSubscriptionPageTitle => 'Add Subscription';

  @override
  String get editSubscriptionPageTitle => 'Edit';

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get purchasePageTitle => 'Go ad-free';

  @override
  String get notificationSettingsPageTitle => 'Notification';

  @override
  String get themeSettingsPageTitle => 'Theme';

  @override
  String get languageSettingsPageTitle => 'Language';

  @override
  String get currencySettingsPageTitle => 'Currency';

  @override
  String get loginErrorPageTitle => 'Login Error';

  @override
  String get saveIconButton => 'Save';

  @override
  String get pickerSaveButton => 'Complete';

  @override
  String get createSubscriptionButton => 'Add';

  @override
  String get updateSubscriptionButton => 'Update';

  @override
  String get openStoreUrlButton => 'Update';

  @override
  String get closeDialogButton => 'Close';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get serviceInfoTitle => 'Service Information';

  @override
  String get iconSelectDialogTitle => 'Select Icon';

  @override
  String get detailInfoTitle => 'Detail Information';

  @override
  String get paymentCycleTitle => 'Payment Cycle';

  @override
  String get firstPaymentDateTitle => 'First Payment Date';

  @override
  String firstPaidOn(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String firstPaidYear(int year) {
    return '$year';
  }

  @override
  String firstPaidMonth(String month) {
    String _temp0 = intl.Intl.selectLogic(
      month,
      {
        '1': 'January',
        '2': 'February',
        '3': 'March',
        '4': 'April',
        '5': 'May',
        '6': 'June',
        '7': 'July',
        '8': 'August',
        '9': 'September',
        '10': 'October',
        '11': 'November',
        '12': 'December',
        'other': 'Unknown month',
      },
    );
    return '$_temp0';
  }

  @override
  String firstPaidDay(int day) {
    return '$day';
  }

  @override
  String daysLeft(int day) {
    return '$day days left';
  }

  @override
  String get memoFormTitle => 'Note';

  @override
  String get serviceNameHint => 'Service Name*';

  @override
  String get priceHint => 'Price*';

  @override
  String get deleteSubscriptionDialogContent =>
      'Are you sure you want to delete this subscription?';

  @override
  String get deleteSubscriptionButton => 'Delete';

  @override
  String get purchaseItemsTitle => 'Paid Plan';

  @override
  String get appSettingsTitle => 'App';

  @override
  String get supportItemsTitle => 'Support';

  @override
  String get authorAppsTitle => 'More Apps by the Developer';

  @override
  String get authorAppGetButton => 'Get';

  @override
  String get eitangochoName => 'Simple Vocabulary Notebook';

  @override
  String get eitangochoTagline => 'Make your own flashcards';

  @override
  String get metronomeName => 'Metronome';

  @override
  String get metronomeTagline => 'Time signature, tempo & BPM';

  @override
  String get appVersionTitle => 'Version';

  @override
  String get purchaseItem => 'Remove ads';

  @override
  String get notificationItem => 'Notification';

  @override
  String get themeItem => 'Theme';

  @override
  String get languageItem => 'Language';

  @override
  String get currencyItem => 'Currency';

  @override
  String get reviewItem => 'App Review';

  @override
  String get shareItem => 'Share';

  @override
  String shareText(String storeUrl) {
    return 'SUBRISU - Subscription & Recurring Expense Tracker\n$storeUrl';
  }

  @override
  String get inquiryItem => 'Inquiry';

  @override
  String get termsOfServiceItem => 'Terms of Service';

  @override
  String get privacyPolicyItem => 'Privacy Policy';

  @override
  String get appVersionItem => 'Version';

  @override
  String get removeAdsItem => 'Remove ads';

  @override
  String get restoreItem => 'Restore purchases';

  @override
  String get subscriptionListNavi => 'List';

  @override
  String get settingsNavi => 'Settings';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get restoreCompletedDialogContent => 'Restoration is complete.';

  @override
  String get loginError => 'Login failed.\nPlease try again after some time.';

  @override
  String get fetchSubscriptionsError =>
      'Failed to retrieve subscription.\nPlease try again after some time.';

  @override
  String get createSubscriptionError =>
      'Failed to register subscription data. Please try again after some time.';

  @override
  String get updateSubscritpionError =>
      'Failed to update subscription data. Please try again after some time.';

  @override
  String get deleteSubscriptionError =>
      'Failed to delete subscription data. Please try again after some time.';

  @override
  String get noPurchaseItemError => 'No purchasable items were found.';

  @override
  String get noPurchaseInfoError =>
      'Past purchase information was not found. Please check the account used for the purchase.';

  @override
  String get openReviewError => 'Failed to open the review page.';

  @override
  String get purchaseError => 'Failed to complete the purchase process.';

  @override
  String get restoreError => 'Failed to complete the restoration process.';

  @override
  String get openUrlError => 'Failed to open the page for the specified URL.';

  @override
  String get noSubscription =>
      'No subscriptions available.\nYou can add subscription using the + button at the bottom right.';

  @override
  String get sortPullDownTitle => 'Sort';

  @override
  String get today => 'today';

  @override
  String get alreadyPurchased => 'Purchased';

  @override
  String get purchaseNotice => 'Ad removal is a one-time purchase.';

  @override
  String get total => 'This Month';

  @override
  String get confirmationDialogTitle => 'Confirm';

  @override
  String get forcedUpdateDialogTitle => 'Update Available';

  @override
  String forcedUpdateDialogContent(String version) {
    return 'A new version of the app is available. Please update to version $version now.';
  }

  @override
  String get updateContentsDialogTitle => 'Update details';

  @override
  String newVersion(String newVersion) {
    return 'version$newVersion';
  }

  @override
  String get thankYouMessage =>
      'Thank you for your continued support of Subrisu.';

  @override
  String get reminder => 'recieve payment reminder';

  @override
  String get reminderDaysBeforeTitle => 'days before payment';

  @override
  String reminderDaysBefore(String days) {
    String _temp0 = intl.Intl.selectLogic(
      days,
      {
        '0': 'payment day',
        '1': '1 day',
        'other': '$days days',
      },
    );
    return '$_temp0';
  }

  @override
  String get reminderHourTitle => 'hour';

  @override
  String get notificationNoticePrefix => 'To receive notifications, ';

  @override
  String get notificationNoticeSettings => 'enable notification settings';

  @override
  String get notificationNoticeSuffix => '.';

  @override
  String theme(String theme) {
    String _temp0 = intl.Intl.selectLogic(
      theme,
      {
        'device': 'System',
        'light': 'Light Mode',
        'dark': 'Dark Mode',
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
        'nextPaymentAsc': 'Payment date',
        'priceAsc': 'Price ↓',
        'priceDesc': 'Price ↑',
        'serviceNameAsc': 'Alphabet ↓',
        'serviceNameDesc': 'Alphabet ↑',
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
        'daily': 'every day',
        'weekly': 'every week',
        'biweekly': 'every two weeks',
        'monthly': 'every month',
        'quarterly': 'every three months',
        'semiAnnual': 'every six months',
        'yearly': 'every year',
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
        'USD': '(\$) US Dollar',
        'JPY': '(¥) Japanese Yen',
        'EUR': '(€) Euro',
        'GBP': '(£) British Pound',
        'CNY': '(¥) Chinese Yuan',
        'INR': '(₹) Indian Rupee',
        'CAD': '(C\$) Canadian Dollar',
        'AUD': '(A\$) Australian Dollar',
        'KRW': '(₩) South Korean Won',
        'other': 'Unknown currency',
      },
    );
    return '$_temp0';
  }
}
