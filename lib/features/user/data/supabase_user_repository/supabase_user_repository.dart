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
        .listen((state) async {
      if (state.event == AuthChangeEvent.signedIn ||
          state.event == AuthChangeEvent.userUpdated) {
        final id = ref.read(supabaseClientProvider).auth.currentUser?.id;
        if (id != null) {
          currentUser = await _getUserProfile(id);
        }
      }
    });

    ref.onDispose(() async => _userChanges.cancel());
  }

  final Ref ref;

  late final StreamSubscription<void> _userChanges;
  UserProfile? currentUser;

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
  Future<void> uploadAvatar(
    File image,
  ) async {
    if (currentUser != null) {
      await ref
          .read(supabaseClientProvider)
          .storage
          .from('avatars')
          .upload('${currentUser!.id}/avatar', image);
    }
  }
}
