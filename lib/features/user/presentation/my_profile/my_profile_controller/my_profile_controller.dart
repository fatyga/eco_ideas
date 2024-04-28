import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/my_profile_controller/my_profile_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_profile_controller.g.dart';

@riverpod
class MyProfileController extends _$MyProfileController {
  @override
  FutureOr<MyProfileState> build() async {
    final userProfileChanges = ref.watch(userProfileChangesProvider);

    return userProfileChanges.when(
      data: (userProfile) async {
        final userAvatar = await ref
            .read(userRepositoryProvider)
            .obtainUserAvatar(userProfile);

        return MyProfileState(userProfile: userProfile, userAvatar: userAvatar);
      },
      error: (error, _) => throw error,
      loading: () => future,
    );
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }

  Future<void> retry() async {
    ref.invalidate(userProfileChangesProvider);
  }
}
