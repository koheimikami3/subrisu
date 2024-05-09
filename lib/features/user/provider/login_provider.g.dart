// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'b09457c93445bbdf44c2623e3856e14bcdc6cad5';

/// ログインを実施するFutureProvider
///
/// RemoteConfigを取得する
/// 初回はFirebaseに匿名サインインする
/// 以降はUserDocumentのtokenを更新することでログイン完了とする
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

typedef LoginRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
