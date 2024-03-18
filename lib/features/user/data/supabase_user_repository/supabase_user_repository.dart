import 'dart:async';
import 'dart:io';

import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/data/user_exception.dart';
import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserRepository implements UserRepository {
  SupabaseUserRepository(this.ref);

  final Ref ref;

  @override
  Future<UserProfile?> getUserProfile() async {
    final supabaseUser = ref.read(supabaseClientProvider).auth.currentUser;
    if (supabaseUser != null) {
      try {
        final json = await ref
            .read(supabaseClientProvider)
            .from('profiles')
            .select<PostgrestMap>()
            .eq('id', supabaseUser.id)
            .limit(1)
            .single();
        final userProfile = UserProfile.fromJson(json);

        return userProfile;
      } catch (_) {
        throw GetUserProfileFail();
      }
    }
    return null;
  }

  @override
  Future<void> uploadAvatar({
    required String? imagePath,
  }) async {
    final currentUser = await getUserProfile();

    if (currentUser != null) {
      try {
        if (imagePath == null) {
          await ref
              .read(supabaseClientProvider)
              .storage
              .from('avatars')
              .remove(['${currentUser.id}/avatar']);
          return;
        }

        final imageFile = File(imagePath);

        // upload avatar to 'avatars' bucket
        await ref
            .read(supabaseClientProvider)
            .storage
            .from('avatars')
            .upload('${currentUser.id}/avatar', imageFile);
      } catch (e) {
        throw UploadAvatarFail();
      }
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile modifiedUserProfile) async {
    final currentUser = await getUserProfile();
    if (currentUser != null) {
      try {
        await ref
            .read(supabaseClientProvider)
            .from('profiles')
            .update(modifiedUserProfile.toJson())
            .eq('id', currentUser.id);
      } catch (e) {
        throw UserProfileUpdateFail();
      }
    }
  }

  @override
  Future<void> completeSignUp({String? avatarPath, String? aboutMe}) async {
    final currentUser = await getUserProfile();

    if (currentUser != null) {
      await uploadAvatar(imagePath: avatarPath);

      await updateUserProfile(
        currentUser.copyWith(aboutMe: aboutMe, signUpCompleted: true),
      );
    }
  }
}
