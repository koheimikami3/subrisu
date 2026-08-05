import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// The title displayed in the AppBar on the Create Subscription Page
  ///
  /// In en, this message translates to:
  /// **'Add Subscription'**
  String get createSubscriptionPageTitle;

  /// The title displayed in the AppBar on the Edit Subscription Page
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editSubscriptionPageTitle;

  /// The title displayed in the AppBar on the Settings Page
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// The title displayed in the AppBar on the Purchase Page
  ///
  /// In en, this message translates to:
  /// **'Go ad-free'**
  String get purchasePageTitle;

  /// The title displayed in the AppBar on the Notification Setting Page
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notificationSettingsPageTitle;

  /// The title displayed in the AppBar on the Theme Setting Page
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeSettingsPageTitle;

  /// The title displayed in the AppBar on the Language Setting Page
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSettingsPageTitle;

  /// The title displayed in the AppBar on the Currency Setting Page
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currencySettingsPageTitle;

  /// The title displayed in the AppBar on the Login Error Page
  ///
  /// In en, this message translates to:
  /// **'Login Error'**
  String get loginErrorPageTitle;

  /// A button that saves the selected icon
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveIconButton;

  /// A button that saves the date selected in the picker
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get pickerSaveButton;

  /// A button that creates a new subscription data
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get createSubscriptionButton;

  /// A button that updates the subscription data
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateSubscriptionButton;

  /// A button that opens the app store URL
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get openStoreUrlButton;

  /// A button that closes the dialog
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeDialogButton;

  /// A button that cancels the operation and closes the dialog
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Service Information'**
  String get serviceInfoTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get iconSelectDialogTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Detail Information'**
  String get detailInfoTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Payment Cycle'**
  String get paymentCycleTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'First Payment Date'**
  String get firstPaymentDateTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String firstPaidOn(DateTime date);

  ///
  ///
  /// In en, this message translates to:
  /// **'{year}'**
  String firstPaidYear(int year);

  ///
  ///
  /// In en, this message translates to:
  /// **'{month, select, 1{January} 2{February} 3{March} 4{April} 5{May} 6{June} 7{July} 8{August} 9{September} 10{October} 11{November} 12{December} other{Unknown month}}'**
  String firstPaidMonth(String month);

  ///
  ///
  /// In en, this message translates to:
  /// **'{day}'**
  String firstPaidDay(int day);

  ///
  ///
  /// In en, this message translates to:
  /// **'{day} days left'**
  String daysLeft(int day);

  ///
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get memoFormTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Service Name*'**
  String get serviceNameHint;

  ///
  ///
  /// In en, this message translates to:
  /// **'Price*'**
  String get priceHint;

  ///
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this subscription?'**
  String get deleteSubscriptionDialogContent;

  ///
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteSubscriptionButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Paid Plan'**
  String get purchaseItemsTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get appSettingsTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get supportItemsTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get appVersionTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Remove ads'**
  String get purchaseItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notificationItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currencyItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'App Review'**
  String get reviewItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'SUBRISU - Subscription & Recurring Expense Tracker\n{storeUrl}'**
  String shareText(String storeUrl);

  ///
  ///
  /// In en, this message translates to:
  /// **'Inquiry'**
  String get inquiryItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get appVersionItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Remove ads'**
  String get removeAdsItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get restoreItem;

  ///
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get subscriptionListNavi;

  ///
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsNavi;

  ///
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorDialogTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Restoration is complete.'**
  String get restoreCompletedDialogContent;

  ///
  ///
  /// In en, this message translates to:
  /// **'Login failed.\nPlease try again after some time.'**
  String get loginError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Failed to retrieve subscription.\nPlease try again after some time.'**
  String get fetchSubscriptionsError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Failed to register subscription data. Please try again after some time.'**
  String get createSubscriptionError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Failed to update subscription data. Please try again after some time.'**
  String get updateSubscritpionError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Failed to delete subscription data. Please try again after some time.'**
  String get deleteSubscriptionError;

  ///
  ///
  /// In en, this message translates to:
  /// **'No purchasable items were found.'**
  String get noPurchaseItemError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Past purchase information was not found. Please check the account used for the purchase.'**
  String get noPurchaseInfoError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Failed to open the review page.'**
  String get openReviewError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Failed to complete the purchase process.'**
  String get purchaseError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Failed to complete the restoration process.'**
  String get restoreError;

  ///
  ///
  /// In en, this message translates to:
  /// **'Failed to open the page for the specified URL.'**
  String get openUrlError;

  ///
  ///
  /// In en, this message translates to:
  /// **'No subscriptions available.\nYou can add subscription using the + button at the bottom right.'**
  String get noSubscription;

  ///
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sortPullDownTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'today'**
  String get today;

  ///
  ///
  /// In en, this message translates to:
  /// **'Purchased'**
  String get alreadyPurchased;

  ///
  ///
  /// In en, this message translates to:
  /// **'Ad removal is a one-time purchase.'**
  String get purchaseNotice;

  ///
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get total;

  ///
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmationDialogTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get forcedUpdateDialogTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'A new version of the app is available. Please update to version {version} now.'**
  String forcedUpdateDialogContent(String version);

  ///
  ///
  /// In en, this message translates to:
  /// **'Update details'**
  String get updateContentsDialogTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'version{newVersion}'**
  String newVersion(String newVersion);

  ///
  ///
  /// In en, this message translates to:
  /// **'Thank you for your continued support of Subrisu.'**
  String get thankYouMessage;

  ///
  ///
  /// In en, this message translates to:
  /// **'recieve payment reminder'**
  String get reminder;

  ///
  ///
  /// In en, this message translates to:
  /// **'days before payment'**
  String get reminderDaysBeforeTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'{days, select, 0{payment day} 1{1 day} other{{days} days}}'**
  String reminderDaysBefore(String days);

  ///
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get reminderHourTitle;

  /// Prefix for the notification supplement text
  ///
  /// In en, this message translates to:
  /// **'To receive notifications, '**
  String get notificationNoticePrefix;

  /// The tappable part of the notification supplement text (device notification settings)
  ///
  /// In en, this message translates to:
  /// **'enable notification settings'**
  String get notificationNoticeSettings;

  /// Suffix for the notification supplement text
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get notificationNoticeSuffix;

  ///
  ///
  /// In en, this message translates to:
  /// **'{theme, select, device{System} light{Light Mode} dark{Dark Mode} other{error}}'**
  String theme(String theme);

  ///
  ///
  /// In en, this message translates to:
  /// **'{language, select, japanese{日本語} english{English} other{error}}'**
  String language(String language);

  ///
  ///
  /// In en, this message translates to:
  /// **'{sort, select, nextPaymentAsc{Payment date} priceAsc{Price ↓} priceDesc{Price ↑} serviceNameAsc{Alphabet ↓} serviceNameDesc{Alphabet ↑} other{error}}'**
  String sort(String sort);

  ///
  ///
  /// In en, this message translates to:
  /// **'{paymentCycle, select, daily{every day} weekly{every week} biweekly{every two weeks} monthly{every month} quarterly{every three months} semiAnnual{every six months} yearly{every year} other{error}}'**
  String paymentCycle(String paymentCycle);

  ///
  ///
  /// In en, this message translates to:
  /// **'{currency, select, USD{(\$) US Dollar} JPY{(¥) Japanese Yen} EUR{(€) Euro} GBP{(£) British Pound} CNY{(¥) Chinese Yuan} INR{(₹) Indian Rupee} CAD{(C\$) Canadian Dollar} AUD{(A\$) Australian Dollar} KRW{(₩) South Korean Won} other{Unknown currency}}'**
  String currency(String currency);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
