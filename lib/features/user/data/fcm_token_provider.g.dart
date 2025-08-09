// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fcmTokenHash() => r'afca8fd08992b80778b8c4b6c39f6e963f16aef4';

/// 端末のFCMトークンを取得するFutureProvider
///
/// エミュレーターでgetToken()を使用するとエラーになるため、
/// リリースモードではgetToken()を使用し、デバッグモードでNULLを返す
///
/// Copied from [fcmToken].
@ProviderFor(fcmToken)
final fcmTokenProvider = AutoDisposeFutureProvider<String?>.internal(
  fcmToken,
  name: r'fcmTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fcmTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FcmTokenRef = AutoDisposeFutureProviderRef<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
