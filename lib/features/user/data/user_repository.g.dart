// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'169697335e173591ba110cc285e4be392fd4faf4';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$userProfileChangesHash() =>
    r'b95f8eccb3465dce266952ed76b1e29cfa8b746b';

/// See also [userProfileChanges].
@ProviderFor(userProfileChanges)
final userProfileChangesProvider =
    AutoDisposeStreamProvider<UserProfile>.internal(
  userProfileChanges,
  name: r'userProfileChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProfileChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserProfileChangesRef = AutoDisposeStreamProviderRef<UserProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
