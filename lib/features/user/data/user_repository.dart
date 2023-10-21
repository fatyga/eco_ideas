import 'package:eco_ideas/features/user/data/supabase_user_repository.dart';
import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    SupabaseUserRepository(ref);

abstract class UserRepository {
  UserRepository();

  Future<UserProfile?> getCurrentUserProfile();
}

class UserFailure implements Exception {}

class UserNotFound extends UserFailure {}
