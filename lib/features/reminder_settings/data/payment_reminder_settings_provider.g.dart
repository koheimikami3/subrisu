// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_reminder_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentReminderSettingsHash() =>
    r'e4ddce5c3636e155c6523498a3ba9e7056150c55';

/// 指定されたユーザーIDでUserDocumentの
/// notification.paymentReminderを取得するFutureProvider
///
/// Copied from [paymentReminderSettings].
@ProviderFor(paymentReminderSettings)
final paymentReminderSettingsProvider =
    AutoDisposeFutureProvider<PaymentReminderSettings>.internal(
  paymentReminderSettings,
  name: r'paymentReminderSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentReminderSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentReminderSettingsRef
    = AutoDisposeFutureProviderRef<PaymentReminderSettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
