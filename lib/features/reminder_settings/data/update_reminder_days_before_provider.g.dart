// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reminder_days_before_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateReminderDaysBeforeHash() =>
    r'3f0ddf8940993a7df7e4e0e85dd5f2a0de4acdbf';

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

/// 指定された値でUserDocumentのreminder.daysBeforeを更新するFutureProvider
///
/// Copied from [updateReminderDaysBefore].
@ProviderFor(updateReminderDaysBefore)
const updateReminderDaysBeforeProvider = UpdateReminderDaysBeforeFamily();

/// 指定された値でUserDocumentのreminder.daysBeforeを更新するFutureProvider
///
/// Copied from [updateReminderDaysBefore].
class UpdateReminderDaysBeforeFamily extends Family<AsyncValue<void>> {
  /// 指定された値でUserDocumentのreminder.daysBeforeを更新するFutureProvider
  ///
  /// Copied from [updateReminderDaysBefore].
  const UpdateReminderDaysBeforeFamily();

  /// 指定された値でUserDocumentのreminder.daysBeforeを更新するFutureProvider
  ///
  /// Copied from [updateReminderDaysBefore].
  UpdateReminderDaysBeforeProvider call(
    int daysBefore,
  ) {
    return UpdateReminderDaysBeforeProvider(
      daysBefore,
    );
  }

  @override
  UpdateReminderDaysBeforeProvider getProviderOverride(
    covariant UpdateReminderDaysBeforeProvider provider,
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
  String? get name => r'updateReminderDaysBeforeProvider';
}

/// 指定された値でUserDocumentのreminder.daysBeforeを更新するFutureProvider
///
/// Copied from [updateReminderDaysBefore].
class UpdateReminderDaysBeforeProvider extends AutoDisposeFutureProvider<void> {
  /// 指定された値でUserDocumentのreminder.daysBeforeを更新するFutureProvider
  ///
  /// Copied from [updateReminderDaysBefore].
  UpdateReminderDaysBeforeProvider(
    int daysBefore,
  ) : this._internal(
          (ref) => updateReminderDaysBefore(
            ref as UpdateReminderDaysBeforeRef,
            daysBefore,
          ),
          from: updateReminderDaysBeforeProvider,
          name: r'updateReminderDaysBeforeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateReminderDaysBeforeHash,
          dependencies: UpdateReminderDaysBeforeFamily._dependencies,
          allTransitiveDependencies:
              UpdateReminderDaysBeforeFamily._allTransitiveDependencies,
          daysBefore: daysBefore,
        );

  UpdateReminderDaysBeforeProvider._internal(
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
    FutureOr<void> Function(UpdateReminderDaysBeforeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateReminderDaysBeforeProvider._internal(
        (ref) => create(ref as UpdateReminderDaysBeforeRef),
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
    return _UpdateReminderDaysBeforeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateReminderDaysBeforeProvider &&
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
mixin UpdateReminderDaysBeforeRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `daysBefore` of this provider.
  int get daysBefore;
}

class _UpdateReminderDaysBeforeProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateReminderDaysBeforeRef {
  _UpdateReminderDaysBeforeProviderElement(super.provider);

  @override
  int get daysBefore => (origin as UpdateReminderDaysBeforeProvider).daysBefore;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
