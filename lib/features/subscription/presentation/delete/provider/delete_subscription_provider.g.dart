// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deleteSubscriptionHash() =>
    r'd9aaa44941adb2c6cc9b85ef1e4d4576acaabb1e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// SubscriptionDocumentを削除するFutureProvider
///
/// Copied from [deleteSubscription].
@ProviderFor(deleteSubscription)
const deleteSubscriptionProvider = DeleteSubscriptionFamily();

/// SubscriptionDocumentを削除するFutureProvider
///
/// Copied from [deleteSubscription].
class DeleteSubscriptionFamily extends Family<AsyncValue<void>> {
  /// SubscriptionDocumentを削除するFutureProvider
  ///
  /// Copied from [deleteSubscription].
  const DeleteSubscriptionFamily();

  /// SubscriptionDocumentを削除するFutureProvider
  ///
  /// Copied from [deleteSubscription].
  DeleteSubscriptionProvider call(
    String subscriptionId,
  ) {
    return DeleteSubscriptionProvider(
      subscriptionId,
    );
  }

  @override
  DeleteSubscriptionProvider getProviderOverride(
    covariant DeleteSubscriptionProvider provider,
  ) {
    return call(
      provider.subscriptionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteSubscriptionProvider';
}

/// SubscriptionDocumentを削除するFutureProvider
///
/// Copied from [deleteSubscription].
class DeleteSubscriptionProvider extends AutoDisposeFutureProvider<void> {
  /// SubscriptionDocumentを削除するFutureProvider
  ///
  /// Copied from [deleteSubscription].
  DeleteSubscriptionProvider(
    String subscriptionId,
  ) : this._internal(
          (ref) => deleteSubscription(
            ref as DeleteSubscriptionRef,
            subscriptionId,
          ),
          from: deleteSubscriptionProvider,
          name: r'deleteSubscriptionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteSubscriptionHash,
          dependencies: DeleteSubscriptionFamily._dependencies,
          allTransitiveDependencies:
              DeleteSubscriptionFamily._allTransitiveDependencies,
          subscriptionId: subscriptionId,
        );

  DeleteSubscriptionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subscriptionId,
  }) : super.internal();

  final String subscriptionId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteSubscriptionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteSubscriptionProvider._internal(
        (ref) => create(ref as DeleteSubscriptionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subscriptionId: subscriptionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteSubscriptionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteSubscriptionProvider &&
        other.subscriptionId == subscriptionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subscriptionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteSubscriptionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `subscriptionId` of this provider.
  String get subscriptionId;
}

class _DeleteSubscriptionProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteSubscriptionRef {
  _DeleteSubscriptionProviderElement(super.provider);

  @override
  String get subscriptionId =>
      (origin as DeleteSubscriptionProvider).subscriptionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
