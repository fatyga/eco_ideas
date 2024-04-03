import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_profile_controller.g.dart';

@riverpod
class MyProfileController extends _$MyProfileController {
  @override
  FutureOr<UserProfile?> build() {
    return ref.read(userRepositoryProvider).getUserProfile();
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}
