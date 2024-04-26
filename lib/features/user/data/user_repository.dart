import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';

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
  Future<bool> checkIfAvatarIsPresent(UserProfile userProfile);
  Future<void> completeSignUp(
    UserProfile userProfile, {
    String? avatarPath,
    String? aboutMe,
  });
}
