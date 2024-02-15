// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createUserHash() => r'afc48048eafe469042d9facc378a9ba589a1f5bb';

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

/// UserDocumentを作成するFutureProvider
///
/// Copied from [createUser].
@ProviderFor(createUser)
const createUserProvider = CreateUserFamily();

/// UserDocumentを作成するFutureProvider
///
/// Copied from [createUser].
class CreateUserFamily extends Family<AsyncValue<void>> {
  /// UserDocumentを作成するFutureProvider
  ///
  /// Copied from [createUser].
  const CreateUserFamily();

  /// UserDocumentを作成するFutureProvider
  ///
  /// Copied from [createUser].
  CreateUserProvider call(
    String userId,
  ) {
    return CreateUserProvider(
      userId,
    );
  }

  @override
  CreateUserProvider getProviderOverride(
    covariant CreateUserProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'createUserProvider';
}

/// UserDocumentを作成するFutureProvider
///
/// Copied from [createUser].
class CreateUserProvider extends AutoDisposeFutureProvider<void> {
  /// UserDocumentを作成するFutureProvider
  ///
  /// Copied from [createUser].
  CreateUserProvider(
    String userId,
  ) : this._internal(
          (ref) => createUser(
            ref as CreateUserRef,
            userId,
          ),
          from: createUserProvider,
          name: r'createUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createUserHash,
          dependencies: CreateUserFamily._dependencies,
          allTransitiveDependencies:
              CreateUserFamily._allTransitiveDependencies,
          userId: userId,
        );

  CreateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateUserProvider._internal(
        (ref) => create(ref as CreateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateUserProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _CreateUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateUserRef {
  _CreateUserProviderElement(super.provider);

  @override
  String get userId => (origin as CreateUserProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
