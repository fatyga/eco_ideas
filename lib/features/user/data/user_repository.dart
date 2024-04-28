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
) =>
    ref.read(userRepositoryProvider).userProfileChanges;

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
