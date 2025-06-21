// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'dfad3c018e35176468a572b43bdbf7573eddb27f';

/// ログインを実施するFutureProvider
///
/// RemoteConfigを取得する
/// 初回はFirebaseに匿名サインインする
/// 以降はUserDocumentのtoken(FCMトークン)を更新することでログイン完了とする
///
/// Copied from [login].
@ProviderFor(login)
final loginProvider = AutoDisposeFutureProvider<void>.internal(
  login,
  name: r'loginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoginRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
