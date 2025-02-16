// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionsHash() => r'3a733f76af1a3eff7deed8ad4d093141fb8d6f5b';

/// サブスクリプションリストを取得するStreamProvider
///
/// 作成日時を基準に昇順に並び替える
///
/// Copied from [subscriptions].
@ProviderFor(subscriptions)
final subscriptionsProvider =
    AutoDisposeStreamProvider<List<Subscription>>.internal(
  subscriptions,
  name: r'subscriptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

// ignore: deprecated_member_use
typedef SubscriptionsRef = AutoDisposeStreamProviderRef<List<Subscription>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
