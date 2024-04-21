import 'dart:async';
import 'dart:io';

import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/data/user_exception.dart';
import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class SupabaseUserRepository implements UserRepository {
  SupabaseUserRepository(this.ref);

  final Ref ref;

  @override
  Stream<UserProfile> get userProfileChanges {
    final userId = ref.read(supabaseClientProvider).auth.currentUser?.id;

    if (userId == null) {
      return Stream.error(UnimplementedError());
    }
    return ref
        .read(supabaseClientProvider)
        .from('profiles')
        .stream(primaryKey: ['id'])
        .eq('id', userId)
        .limit(1)
        .map(
          (profilesList) => UserProfile.fromJson(profilesList.first),
        );
  }

  @override
  Future<void> uploadAvatar(
    UserProfile userProfile, {
    required String? imagePath,
  }) async {
    try {
      if (imagePath == null) {
        await ref
            .read(supabaseClientProvider)
            .storage
            .from('avatars')
            .remove(['${userProfile.id}/avatar']);
        return;
      }

      final imageFile = File(imagePath);

      final isAvatarPresent = await checkIfAvatarIsPresent(userProfile);
      if (isAvatarPresent) {
        // remove avatar if there is one
        await ref
            .read(supabaseClientProvider)
            .storage
            .from('avatars')
            .remove(['${userProfile.id}/avatar']);
      }
      // upload avatar to 'avatars' bucket
      await ref
          .read(supabaseClientProvider)
          .storage
          .from('avatars')
          .upload('${userProfile.id}/avatar', imageFile);
    } catch (e) {
      throw UploadAvatarFail();
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile modifiedUserProfile) async {
    try {
      await ref
          .read(supabaseClientProvider)
          .from('profiles')
          .update(modifiedUserProfile.toJson())
          .eq('id', modifiedUserProfile.id);
    } catch (e) {
      throw UserProfileUpdateFail();
    }
  }

  @override
  Future<void> completeSignUp(
    UserProfile userProfile, {
    String? avatarPath,
    String? aboutMe,
  }) async {
    await uploadAvatar(userProfile, imagePath: avatarPath);

    await updateUserProfile(
      userProfile.copyWith(aboutMe: aboutMe, signUpCompleted: true),
    );
  }

  @override
  Future<bool> checkIfAvatarIsPresent(UserProfile userProfile) async {
    final url = Uri.parse(userProfile.avatarUrl);
    final response = await http.head(url);

    if (response.statusCode == 200) return true;
    return false;
  }
}
