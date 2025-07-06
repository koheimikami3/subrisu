// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reminder_hour_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateReminderHourHash() =>
    r'449307c54769d3047593e6d695ca7b93954f82c8';

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

/// 指定された値でUserDocumentのreminder.hourを更新するFutureProvider
///
/// Copied from [updateReminderHour].
@ProviderFor(updateReminderHour)
const updateReminderHourProvider = UpdateReminderHourFamily();

/// 指定された値でUserDocumentのreminder.hourを更新するFutureProvider
///
/// Copied from [updateReminderHour].
class UpdateReminderHourFamily extends Family<AsyncValue<void>> {
  /// 指定された値でUserDocumentのreminder.hourを更新するFutureProvider
  ///
  /// Copied from [updateReminderHour].
  const UpdateReminderHourFamily();

  /// 指定された値でUserDocumentのreminder.hourを更新するFutureProvider
  ///
  /// Copied from [updateReminderHour].
  UpdateReminderHourProvider call(
    int hour,
  ) {
    return UpdateReminderHourProvider(
      hour,
    );
  }

  @override
  UpdateReminderHourProvider getProviderOverride(
    covariant UpdateReminderHourProvider provider,
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
  String? get name => r'updateReminderHourProvider';
}

/// 指定された値でUserDocumentのreminder.hourを更新するFutureProvider
///
/// Copied from [updateReminderHour].
class UpdateReminderHourProvider extends AutoDisposeFutureProvider<void> {
  /// 指定された値でUserDocumentのreminder.hourを更新するFutureProvider
  ///
  /// Copied from [updateReminderHour].
  UpdateReminderHourProvider(
    int hour,
  ) : this._internal(
          (ref) => updateReminderHour(
            ref as UpdateReminderHourRef,
            hour,
          ),
          from: updateReminderHourProvider,
          name: r'updateReminderHourProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateReminderHourHash,
          dependencies: UpdateReminderHourFamily._dependencies,
          allTransitiveDependencies:
              UpdateReminderHourFamily._allTransitiveDependencies,
          hour: hour,
        );

  UpdateReminderHourProvider._internal(
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
    FutureOr<void> Function(UpdateReminderHourRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateReminderHourProvider._internal(
        (ref) => create(ref as UpdateReminderHourRef),
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
    return _UpdateReminderHourProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateReminderHourProvider && other.hour == hour;
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
mixin UpdateReminderHourRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `hour` of this provider.
  int get hour;
}

class _UpdateReminderHourProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateReminderHourRef {
  _UpdateReminderHourProviderElement(super.provider);

  @override
  int get hour => (origin as UpdateReminderHourProvider).hour;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
