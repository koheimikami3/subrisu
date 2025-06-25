// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencySettingsNotifierHash() =>
    r'3a2bcd2576de455070484b0cecca3bd716d404a4';

/// アプリケーションの通貨設定を管理するNotifierProvider
///
/// Copied from [CurrencySettingsNotifier].
@ProviderFor(CurrencySettingsNotifier)
final currencySettingsNotifierProvider = AutoDisposeNotifierProvider<
    CurrencySettingsNotifier, CurrencySettings>.internal(
  CurrencySettingsNotifier.new,
  name: r'currencySettingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currencySettingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrencySettingsNotifier = AutoDisposeNotifier<CurrencySettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
