// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_payment_reminder_hour_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updatePaymentReminderHourHash() =>
    r'04d28dc5a2f8a3a363b3af7243ea572b05797f8d';

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
/// notification.paymentReminder.hourを更新するFutureProvider
///
/// Copied from [updatePaymentReminderHour].
@ProviderFor(updatePaymentReminderHour)
const updatePaymentReminderHourProvider = UpdatePaymentReminderHourFamily();

/// 指定された値でUserDocumentの
/// notification.paymentReminder.hourを更新するFutureProvider
///
/// Copied from [updatePaymentReminderHour].
class UpdatePaymentReminderHourFamily extends Family<AsyncValue<void>> {
  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.hourを更新するFutureProvider
  ///
  /// Copied from [updatePaymentReminderHour].
  const UpdatePaymentReminderHourFamily();

  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.hourを更新するFutureProvider
  ///
  /// Copied from [updatePaymentReminderHour].
  UpdatePaymentReminderHourProvider call(
    int hour,
  ) {
    return UpdatePaymentReminderHourProvider(
      hour,
    );
  }

  @override
  UpdatePaymentReminderHourProvider getProviderOverride(
    covariant UpdatePaymentReminderHourProvider provider,
  ) {
    return call(
      provider.hour,
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
  String? get name => r'updatePaymentReminderHourProvider';
}

/// 指定された値でUserDocumentの
/// notification.paymentReminder.hourを更新するFutureProvider
///
/// Copied from [updatePaymentReminderHour].
class UpdatePaymentReminderHourProvider
    extends AutoDisposeFutureProvider<void> {
  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.hourを更新するFutureProvider
  ///
  /// Copied from [updatePaymentReminderHour].
  UpdatePaymentReminderHourProvider(
    int hour,
  ) : this._internal(
          (ref) => updatePaymentReminderHour(
            ref as UpdatePaymentReminderHourRef,
            hour,
          ),
          from: updatePaymentReminderHourProvider,
          name: r'updatePaymentReminderHourProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePaymentReminderHourHash,
          dependencies: UpdatePaymentReminderHourFamily._dependencies,
          allTransitiveDependencies:
              UpdatePaymentReminderHourFamily._allTransitiveDependencies,
          hour: hour,
        );

  UpdatePaymentReminderHourProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hour,
  }) : super.internal();

  final int hour;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdatePaymentReminderHourRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePaymentReminderHourProvider._internal(
        (ref) => create(ref as UpdatePaymentReminderHourRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hour: hour,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdatePaymentReminderHourProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePaymentReminderHourProvider && other.hour == hour;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hour.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdatePaymentReminderHourRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `hour` of this provider.
  int get hour;
}

class _UpdatePaymentReminderHourProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdatePaymentReminderHourRef {
  _UpdatePaymentReminderHourProviderElement(super.provider);

  @override
  int get hour => (origin as UpdatePaymentReminderHourProvider).hour;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
