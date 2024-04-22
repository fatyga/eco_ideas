import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';

import 'package:eco_ideas/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_profile_controller.g.dart';

@riverpod
class MyProfileController extends _$MyProfileController {
  @override
  Future<UserProfile> build() async {
    final keepAlive = ref.keepAlive();
    final userProfile = ref.watch(userProfileChangesProvider);

    // Dispose this controller when user signs out
    ref.listen(authChangesProvider, (_, next) {
      final authStatus = next.valueOrNull;

      if (authStatus != null) {
        if (authStatus.isUnauthenticated || authStatus.isUnknown) {
          keepAlive.close();
        }
      }
    });
    return userProfile.requireValue;
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}
