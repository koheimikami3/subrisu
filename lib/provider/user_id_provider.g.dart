// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userIdHash() => r'14b928dcd9d88e7ac383315c36d75abc6ed56ef6';

/// FirebaseAuthのCurrentUserIdを取得するProvider
///
/// Copied from [userId].
@ProviderFor(userId)
final userIdProvider = AutoDisposeProvider<String>.internal(
  userId,
  name: r'userIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserIdRef = AutoDisposeProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
