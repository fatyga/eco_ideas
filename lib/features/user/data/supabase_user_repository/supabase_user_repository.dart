import 'dart:async';
import 'dart:io';

import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserRepository implements UserRepository {
  SupabaseUserRepository(this.ref);

  final Ref ref;

  UserProfile? _currentUserProfile;

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
        _currentUserProfile = userProfile;
        return userProfile;
      } catch (_) {
        _currentUserProfile = null;
        return null;
      }
    }
    return null;
  }

  @override
  Future<void> uploadAvatar({
    required String imagePath,
  }) async {
    if (_currentUserProfile != null) {
      final imageFile = File(imagePath);
      // upload avatar to 'avatars' bucket

      await ref
          .read(supabaseClientProvider)
          .storage
          .from('avatars')
          .upload('${_currentUserProfile!.id}/avatar', imageFile);
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile modifiedUserProfile) async {
    if (_currentUserProfile != null &&
        _currentUserProfile != modifiedUserProfile) {
      await ref
          .read(supabaseClientProvider)
          .from('profiles')
          .update(modifiedUserProfile.toJson())
          .eq('id', _currentUserProfile!.id);
    }
  }
}
