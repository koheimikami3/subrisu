// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_payment_reminder_days_before_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updatePaymentReminderDaysBeforeHash() =>
    r'4529bcf2febbb4e7c75e4f1db8345432ae12ad65';

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
/// notification.paymentReminder.daysBeforeを更新するFutureProvider
///
/// Copied from [updatePaymentReminderDaysBefore].
@ProviderFor(updatePaymentReminderDaysBefore)
const updatePaymentReminderDaysBeforeProvider =
    UpdatePaymentReminderDaysBeforeFamily();

/// 指定された値でUserDocumentの
/// notification.paymentReminder.daysBeforeを更新するFutureProvider
///
/// Copied from [updatePaymentReminderDaysBefore].
class UpdatePaymentReminderDaysBeforeFamily extends Family<AsyncValue<void>> {
  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.daysBeforeを更新するFutureProvider
  ///
  /// Copied from [updatePaymentReminderDaysBefore].
  const UpdatePaymentReminderDaysBeforeFamily();

  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.daysBeforeを更新するFutureProvider
  ///
  /// Copied from [updatePaymentReminderDaysBefore].
  UpdatePaymentReminderDaysBeforeProvider call(
    int daysBefore,
  ) {
    return UpdatePaymentReminderDaysBeforeProvider(
      daysBefore,
    );
  }

  @override
  UpdatePaymentReminderDaysBeforeProvider getProviderOverride(
    covariant UpdatePaymentReminderDaysBeforeProvider provider,
  ) {
    return call(
      provider.daysBefore,
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
  String? get name => r'updatePaymentReminderDaysBeforeProvider';
}

/// 指定された値でUserDocumentの
/// notification.paymentReminder.daysBeforeを更新するFutureProvider
///
/// Copied from [updatePaymentReminderDaysBefore].
class UpdatePaymentReminderDaysBeforeProvider
    extends AutoDisposeFutureProvider<void> {
  /// 指定された値でUserDocumentの
  /// notification.paymentReminder.daysBeforeを更新するFutureProvider
  ///
  /// Copied from [updatePaymentReminderDaysBefore].
  UpdatePaymentReminderDaysBeforeProvider(
    int daysBefore,
  ) : this._internal(
          (ref) => updatePaymentReminderDaysBefore(
            ref as UpdatePaymentReminderDaysBeforeRef,
            daysBefore,
          ),
          from: updatePaymentReminderDaysBeforeProvider,
          name: r'updatePaymentReminderDaysBeforeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePaymentReminderDaysBeforeHash,
          dependencies: UpdatePaymentReminderDaysBeforeFamily._dependencies,
          allTransitiveDependencies:
              UpdatePaymentReminderDaysBeforeFamily._allTransitiveDependencies,
          daysBefore: daysBefore,
        );

  UpdatePaymentReminderDaysBeforeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.daysBefore,
  }) : super.internal();

  final int daysBefore;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdatePaymentReminderDaysBeforeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePaymentReminderDaysBeforeProvider._internal(
        (ref) => create(ref as UpdatePaymentReminderDaysBeforeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        daysBefore: daysBefore,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdatePaymentReminderDaysBeforeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePaymentReminderDaysBeforeProvider &&
        other.daysBefore == daysBefore;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, daysBefore.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdatePaymentReminderDaysBeforeRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `daysBefore` of this provider.
  int get daysBefore;
}

class _UpdatePaymentReminderDaysBeforeProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdatePaymentReminderDaysBeforeRef {
  _UpdatePaymentReminderDaysBeforeProviderElement(super.provider);

  @override
  int get daysBefore =>
      (origin as UpdatePaymentReminderDaysBeforeProvider).daysBefore;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
