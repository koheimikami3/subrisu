// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeSettingsNotifierHash() =>
    r'88fd86f61b6ed5102a17d46c1d3245676af10637';

/// アプリケーションのテーマ設定を管理するNotifierProvider
///
/// Copied from [ThemeSettingsNotifier].
@ProviderFor(ThemeSettingsNotifier)
final themeSettingsNotifierProvider =
    AutoDisposeNotifierProvider<ThemeSettingsNotifier, ThemeSettings>.internal(
  ThemeSettingsNotifier.new,
  name: r'themeSettingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeSettingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeSettingsNotifier = AutoDisposeNotifier<ThemeSettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
