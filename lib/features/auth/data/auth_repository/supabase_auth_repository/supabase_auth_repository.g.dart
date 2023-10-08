// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseAuthRepositoryHash() =>
    r'1ac79bfd8afd765187d4ef4167a62d9ea3e45f91';

/// See also [supabaseAuthRepository].
@ProviderFor(supabaseAuthRepository)
final supabaseAuthRepositoryProvider =
    AutoDisposeProvider<SupabaseAuthRepository>.internal(
  supabaseAuthRepository,
  name: r'supabaseAuthRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseAuthRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseAuthRepositoryRef
    = AutoDisposeProviderRef<SupabaseAuthRepository>;
String _$goTrueClientHash() => r'6c05dba612cf008b9b37f660fdfaeeca0396955b';

/// See also [goTrueClient].
@ProviderFor(goTrueClient)
final goTrueClientProvider =
    AutoDisposeProvider<supabase.GoTrueClient>.internal(
  goTrueClient,
  name: r'goTrueClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goTrueClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoTrueClientRef = AutoDisposeProviderRef<supabase.GoTrueClient>;
String _$authChangesHash() => r'c58bf0d474c6af93c20823cd58c8550e6cbb2de7';

/// See also [authChanges].
@ProviderFor(authChanges)
final authChangesProvider = AutoDisposeStreamProvider<AuthStatus>.internal(
  authChanges,
  name: r'authChangesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthChangesRef = AutoDisposeStreamProviderRef<AuthStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
