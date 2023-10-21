import 'package:eco_ideas/common_providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupabaseUserRepository implements UserRepository {
  SupabaseUserRepository(this.ref);
  final Ref ref;

  @override
  Future<UserProfile?> getCurrentUserProfile() async {
    final supabaseUser = ref.read(supabaseClientProvider).auth.currentUser;

    if (supabaseUser == null) {
      return null;
    } else {
      return _getUserProfileFromUID(supabaseUser.id);
    }
  }

  Future<UserProfile> _getUserProfileFromUID(String uid) async {
    final json = await ref
        .read(supabaseClientProvider)
        .from('profiles')
        .select<Map<String, dynamic>>()
        .eq('id', 'uid')
        .limit(1)
        .single();

    return UserProfile.fromJson(json);
  }
}
