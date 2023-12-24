// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchHomeHash() => r'1d87c88567486e08eeae9b89b25812ced5990bfc';

/// See also [fetchHome].
@ProviderFor(fetchHome)
final fetchHomeProvider = AutoDisposeFutureProvider<String>.internal(
  fetchHome,
  name: r'fetchHomeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchHomeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchHomeRef = AutoDisposeFutureProviderRef<String>;
String _$fetchUserDataHash() => r'ec99abfae6f051427dfc3c188ec8e6ff48b130f9';

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

typedef FetchUserDataRef = AutoDisposeFutureProviderRef<String>;

/// See also [fetchUserData].
@ProviderFor(fetchUserData)
const fetchUserDataProvider = FetchUserDataFamily();

/// See also [fetchUserData].
class FetchUserDataFamily extends Family<AsyncValue<String>> {
  /// See also [fetchUserData].
  const FetchUserDataFamily();

  /// See also [fetchUserData].
  FetchUserDataProvider call({
    required String id,
  }) {
    return FetchUserDataProvider(
      id: id,
    );
  }

  @override
  FetchUserDataProvider getProviderOverride(
    covariant FetchUserDataProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'fetchUserDataProvider';
}

/// See also [fetchUserData].
class FetchUserDataProvider extends AutoDisposeFutureProvider<String> {
  /// See also [fetchUserData].
  FetchUserDataProvider({
    required this.id,
  }) : super.internal(
          (ref) => fetchUserData(
            ref,
            id: id,
          ),
          from: fetchUserDataProvider,
          name: r'fetchUserDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserDataHash,
          dependencies: FetchUserDataFamily._dependencies,
          allTransitiveDependencies:
              FetchUserDataFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is FetchUserDataProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$loginHash() => r'0ac0a0b4c24a5d0281fc04912c97744bb9e23149';

/// See also [login].
@ProviderFor(login)
final loginProvider = AutoDisposeFutureProvider<String>.internal(
  login,
  name: r'loginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginRef = AutoDisposeFutureProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
