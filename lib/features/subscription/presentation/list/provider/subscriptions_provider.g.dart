// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionsHash() => r'553fc9133464bd175fb41ba06e8c6abce055e3e0';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubscriptionsRef = AutoDisposeStreamProviderRef<List<Subscription>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
