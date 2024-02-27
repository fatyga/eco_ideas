import 'package:eco_ideas/features/user/user.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    SupabaseUserRepository(ref);

abstract class UserRepository {
  UserRepository();
  UserProfile? currentUserProfile;
  Future<void> uploadAvatar({required String imagePath});
}

class UserFailure implements Exception {}

class UserNotFound extends UserFailure {}
