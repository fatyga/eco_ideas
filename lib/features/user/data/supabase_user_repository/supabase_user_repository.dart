import 'dart:async';
import 'dart:io';

import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserRepository implements UserRepository {
  SupabaseUserRepository(this.ref) {
    _userChanges = ref
        .read(supabaseClientProvider)
        .auth
        .onAuthStateChange
        .listen(_onUserChange);

    ref.onDispose(() async => _userChanges.cancel());
  }

  final Ref ref;

  late final StreamSubscription<void> _userChanges;
  @override
  UserProfile? currentUserProfile;

  Future<void> _onUserChange(AuthState state) async {
    if (state.event == AuthChangeEvent.signedIn ||
        state.event == AuthChangeEvent.userUpdated) {
      final id = state.session?.user.id;
      if (id != null) {
        currentUserProfile = await _getUserProfile(id);
      }
    } else {
      currentUserProfile = null;
    }
  }

  Future<UserProfile?> _getUserProfile(String id) async {
    final json = await ref
        .read(supabaseClientProvider)
        .from('profiles')
        .select<PostgrestMap>()
        .eq('id', id)
        .limit(1)
        .single();

    return UserProfile.fromJson(json);
  }

  @override
  Future<void> uploadAvatar({
    required String imagePath,
  }) async {
    if (currentUserProfile != null) {
      final imageFile = File(imagePath);
      // upload avatar to 'avatars' bucket
      await ref
          .read(supabaseClientProvider)
          .storage
          .from('avatars')
          .upload('${currentUserProfile!.id}/avatar', imageFile);

      // update flag isAvatarPresent, when avatar is uploaded successfully
      await ref
          .read(supabaseClientProvider)
          .from('profiles')
          .update({'is_avatar_present': true}).eq('id', currentUserProfile!.id);
    }
  }
}
