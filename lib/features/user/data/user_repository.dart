import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/utils/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(Ref ref) =>
    UserRepository(client: ref.read(supabaseClientProvider));

@riverpod
Future<UserProfile?> currentUserProfile(Ref ref) {
  final authState = ref.watch(authChangesProvider);

  return authState.when(
    data: (authState) => ref
        .read(userRepositoryProvider)
        .getUserProfile(authState.session!.user.id),
    error: (e, _) => Future.value(),
    loading: Future.value,
  );
}

class UserRepository {
  const UserRepository({required this.client});

  final SupabaseClient client;

  User? get currentUser => client.auth.currentSession?.user;

  Future<UserProfile> getUserProfile(String userId) async {
    final response = await client
        .from('profile')
        .select()
        .eq('id', userId)
        .limit(1)
        .single();

    return UserProfile.fromJson(response);
  }
}
