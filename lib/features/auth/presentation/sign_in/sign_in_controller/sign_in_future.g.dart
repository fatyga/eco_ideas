// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_future.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInWithEmailHash() => r'9a4eb8d87d0410a6b84d6252d0f40545c01bc43d';

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

/// See also [signInWithEmail].
@ProviderFor(signInWithEmail)
const signInWithEmailProvider = SignInWithEmailFamily();

/// See also [signInWithEmail].
class SignInWithEmailFamily extends Family<AsyncValue<void>> {
  /// See also [signInWithEmail].
  const SignInWithEmailFamily();

  /// See also [signInWithEmail].
  SignInWithEmailProvider call(
    String email,
    String password,
  ) {
    return SignInWithEmailProvider(
      email,
      password,
    );
  }

  @override
  SignInWithEmailProvider getProviderOverride(
    covariant SignInWithEmailProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
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
  String? get name => r'signInWithEmailProvider';
}

/// See also [signInWithEmail].
class SignInWithEmailProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signInWithEmail].
  SignInWithEmailProvider(
    String email,
    String password,
  ) : this._internal(
          (ref) => signInWithEmail(
            ref as SignInWithEmailRef,
            email,
            password,
          ),
          from: signInWithEmailProvider,
          name: r'signInWithEmailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInWithEmailHash,
          dependencies: SignInWithEmailFamily._dependencies,
          allTransitiveDependencies:
              SignInWithEmailFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  SignInWithEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<void> Function(SignInWithEmailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignInWithEmailProvider._internal(
        (ref) => create(ref as SignInWithEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SignInWithEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInWithEmailProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignInWithEmailRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignInWithEmailProviderElement
    extends AutoDisposeFutureProviderElement<void> with SignInWithEmailRef {
  _SignInWithEmailProviderElement(super.provider);

  @override
  String get email => (origin as SignInWithEmailProvider).email;
  @override
  String get password => (origin as SignInWithEmailProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
