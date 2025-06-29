import 'dart:io';

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
Future<UserProfile> currentUserProfile(Ref ref) async {
  final keepAliveRef = ref.keepAlive();
  final authState = ref.watch(authChangesProvider);

  if (authState.hasError) keepAliveRef.close();

  return ref
      .read(userRepositoryProvider)
      .getUserProfile(authState.requireValue.session!.user);
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

    return UserProfile.fromJson(response);
  }

  Future<void> updateUserProfile(
    String userId,
    Map<String, dynamic> changedFields,
  ) async {
    await client
        .from('profile')
        .update(changedFields)
        .eq(ProfileTable.id, userId);
  }

  Future<void> uploadAvatar(String userId, XFile imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final fileExt = imageFile.path.split('.').last;
    final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
    final filePath = fileName;

    await client.storage.from('avatars').uploadBinary(
          filePath,
          bytes,
          fileOptions: FileOptions(contentType: imageFile.mimeType),
        );
    final imageUrlResponse = await client.storage
        .from('avatars')
        .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);

    await client.from('profile').update(
      {ProfileTable.avatarUrl: imageUrlResponse},
    ).eq(ProfileTable.id, userId);
  }
}
