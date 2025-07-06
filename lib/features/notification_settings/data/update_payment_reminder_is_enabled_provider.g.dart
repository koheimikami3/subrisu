// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_payment_reminder_is_enabled_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateReminderIsEnabledHash() =>
    r'd70b646084a5aea18a6168279352bfdecdd59817';

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

/// 指定された値でUserDocumentの
/// notification.paymentReminder.isEnabledを更新するFutureProvider
///
/// Copied from [updateReminderIsEnabled].
@ProviderFor(updateReminderIsEnabled)
const updateReminderIsEnabledProvider = UpdateReminderIsEnabledFamily();

/// 指定された値でUserDocumentの
/// notification.paymentReminder.isEnabledを更新するFutureProvider
///
/// Copied from [updateReminderIsEnabled].
class UpdateReminderIsEnabledFamily extends Family<AsyncValue<void>> {
  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.isEnabledを更新するFutureProvider
  ///
  /// Copied from [updateReminderIsEnabled].
  const UpdateReminderIsEnabledFamily();

  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.isEnabledを更新するFutureProvider
  ///
  /// Copied from [updateReminderIsEnabled].
  UpdateReminderIsEnabledProvider call(
    bool isEnabled,
  ) {
    return UpdateReminderIsEnabledProvider(
      isEnabled,
    );
  }

  @override
  UpdateReminderIsEnabledProvider getProviderOverride(
    covariant UpdateReminderIsEnabledProvider provider,
  ) {
    return call(
      provider.isEnabled,
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
  String? get name => r'updateReminderIsEnabledProvider';
}

/// 指定された値でUserDocumentの
/// notification.paymentReminder.isEnabledを更新するFutureProvider
///
/// Copied from [updateReminderIsEnabled].
class UpdateReminderIsEnabledProvider extends AutoDisposeFutureProvider<void> {
  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.isEnabledを更新するFutureProvider
  ///
  /// Copied from [updateReminderIsEnabled].
  UpdateReminderIsEnabledProvider(
    bool isEnabled,
  ) : this._internal(
          (ref) => updateReminderIsEnabled(
            ref as UpdateReminderIsEnabledRef,
            isEnabled,
          ),
          from: updateReminderIsEnabledProvider,
          name: r'updateReminderIsEnabledProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateReminderIsEnabledHash,
          dependencies: UpdateReminderIsEnabledFamily._dependencies,
          allTransitiveDependencies:
              UpdateReminderIsEnabledFamily._allTransitiveDependencies,
          isEnabled: isEnabled,
        );

  UpdateReminderIsEnabledProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isEnabled,
  }) : super.internal();

  final bool isEnabled;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateReminderIsEnabledRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateReminderIsEnabledProvider._internal(
        (ref) => create(ref as UpdateReminderIsEnabledRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isEnabled: isEnabled,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateReminderIsEnabledProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateReminderIsEnabledProvider &&
        other.isEnabled == isEnabled;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isEnabled.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateReminderIsEnabledRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `isEnabled` of this provider.
  bool get isEnabled;
}

class _UpdateReminderIsEnabledProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateReminderIsEnabledRef {
  _UpdateReminderIsEnabledProviderElement(super.provider);

  @override
  bool get isEnabled => (origin as UpdateReminderIsEnabledProvider).isEnabled;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
