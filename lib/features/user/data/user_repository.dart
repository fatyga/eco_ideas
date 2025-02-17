import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/utils/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(Ref ref) =>
    UserRepository(client: ref.read(supabaseClientProvider));

@riverpod
Future<UserProfile> currentUserProfile(Ref ref) {
  // TODO(fatyga): make sure, that value is always present
  final authState = ref.watch(authChangesProvider).requireValue;

  return ref
      .read(userRepositoryProvider)
      .getUserProfile(authState.session!.user);
}

class UserRepository {
  const UserRepository({required this.client});

  final SupabaseClient client;

  User? get currentUser => client.auth.currentSession?.user;

  Future<UserProfile> getUserProfile(User user) async {
    final response = await client
        .from('profile')
        .select()
        .eq('id', user.id)
        .limit(1)
        .single();

    response.addAll({'username': user.userMetadata!['display_name']});
    return UserProfile.fromJson(response);
  }

  Future<void> updateUserProfile(
      UserProfile userProfile, XFile? newAvatar) async {
    await client.auth.updateUser(
        UserAttributes(data: {'display_name', userProfile.username}));

    await client
        .from('profile')
        .update(userProfile.toJson())
        .eq('id', userProfile.id);
  }
}
