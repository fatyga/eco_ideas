import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';

import 'package:eco_ideas/features/user/user.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    SupabaseUserRepository(ref);

@riverpod
Stream<UserProfile> userProfileChanges(
  UserProfileChangesRef ref,
) {
  final keepAlive = ref.keepAlive();
  ref
      .watch(supabaseClientProvider)
      .auth
      .onAuthStateChange
      .where((event) => event.event == AuthChangeEvent.signedOut)
      .listen((event) => keepAlive.close());

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
  Future<bool> checkIfAvatarIsPresent(UserProfile userProfile);
  Future<void> completeSignUp(
    UserProfile userProfile, {
    String? avatarPath,
    String? aboutMe,
  });
}
