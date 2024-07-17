import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar.dart';

import 'package:eco_ideas/features/user/user.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    SupabaseUserRepository(ref);

@riverpod
Stream<UserProfile> userProfileChanges(
  UserProfileChangesRef ref,
) {
  final keepAlive = ref.keepAlive();

  // Keep this provider active, when user is authenticated
  ref.watch(authChangesProvider).whenData((status) {
    if (status.isUnauthenticated) {
      keepAlive.close();
    }
  });
  return ref.read(userRepositoryProvider).userProfileChanges;
}

abstract class UserRepository {
  UserRepository();

  Stream<UserProfile> get userProfileChanges;
  Future<void> updateUserProfile(UserProfile modifiedUserProfile);

  Future<void> uploadAvatar(
    UserProfile userProfile, {
    required String? imagePath,
  });
  Future<UserAvatar?> obtainUserAvatar(UserProfile userProfile);
  Future<void> completeSignUp(
    UserProfile userProfile, {
    String? avatarPath,
    String? aboutMe,
  });
}
