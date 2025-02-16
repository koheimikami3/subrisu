// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateSubscriptionHash() =>
    r'0aff1b72115c4582deffe9c7f911d75e3f29cba1';

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

/// SubscriptionDocumentを更新するFutureProvider
///
/// Copied from [updateSubscription].
@ProviderFor(updateSubscription)
const updateSubscriptionProvider = UpdateSubscriptionFamily();

/// SubscriptionDocumentを更新するFutureProvider
///
/// Copied from [updateSubscription].
class UpdateSubscriptionFamily extends Family<AsyncValue<void>> {
  /// SubscriptionDocumentを更新するFutureProvider
  ///
  /// Copied from [updateSubscription].
  const UpdateSubscriptionFamily();

  /// SubscriptionDocumentを更新するFutureProvider
  ///
  /// Copied from [updateSubscription].
  UpdateSubscriptionProvider call(
    String subscriptionId,
  ) {
    return UpdateSubscriptionProvider(
      subscriptionId,
    );
  }

  @override
  UpdateSubscriptionProvider getProviderOverride(
    covariant UpdateSubscriptionProvider provider,
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
  String? get name => r'updateSubscriptionProvider';
}

/// SubscriptionDocumentを更新するFutureProvider
///
/// Copied from [updateSubscription].
class UpdateSubscriptionProvider extends AutoDisposeFutureProvider<void> {
  /// SubscriptionDocumentを更新するFutureProvider
  ///
  /// Copied from [updateSubscription].
  UpdateSubscriptionProvider(
    String subscriptionId,
  ) : this._internal(
          (ref) => updateSubscription(
            ref as UpdateSubscriptionRef,
            subscriptionId,
          ),
          from: updateSubscriptionProvider,
          name: r'updateSubscriptionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateSubscriptionHash,
          dependencies: UpdateSubscriptionFamily._dependencies,
          allTransitiveDependencies:
              UpdateSubscriptionFamily._allTransitiveDependencies,
          subscriptionId: subscriptionId,
        );

  UpdateSubscriptionProvider._internal(
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
    FutureOr<void> Function(UpdateSubscriptionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateSubscriptionProvider._internal(
        (ref) => create(ref as UpdateSubscriptionRef),
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
    return _UpdateSubscriptionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateSubscriptionProvider &&
        other.subscriptionId == subscriptionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subscriptionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

// ignore: deprecated_member_use
mixin UpdateSubscriptionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `subscriptionId` of this provider.
  String get subscriptionId;
}

class _UpdateSubscriptionProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateSubscriptionRef {
  _UpdateSubscriptionProviderElement(super.provider);

  @override
  String get subscriptionId =>
      (origin as UpdateSubscriptionProvider).subscriptionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
