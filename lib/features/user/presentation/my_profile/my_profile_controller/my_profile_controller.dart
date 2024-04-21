import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_profile_controller.g.dart';

@riverpod
class MyProfileController extends _$MyProfileController {
  @override
  Future<UserProfile> build() async {
    final userProfile = ref.watch(userProfileChangesProvider);
    return userProfile.requireValue;
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}
