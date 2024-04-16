import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_avatar_controller.g.dart';

@riverpod
class UserAvatarController extends _$UserAvatarController {
  @override
  Future<UserAvatar?> build() async {
    final currentUser = await ref.read(userRepositoryProvider).getUserProfile();
    if (currentUser != null) {
      final isAvatarExists =
          await ref.read(userRepositoryProvider).checkIfAvatarIsPresent();
      if (isAvatarExists) return UserAvatar.network(currentUser.avatarUrl);
    }
    return null;
  }

  Future<void> uploadAvatar(UserAvatar? avatar) async {
    if (avatar != state.value) {
      await ref
          .read(userRepositoryProvider)
          .uploadAvatar(imagePath: avatar?.path);
    }
  }
}
