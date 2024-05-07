import 'package:eco_ideas/common/widgets/user_avatar/ei_circle_avatar.dart';
import 'package:eco_ideas/features/user/presentation/modify_my_profile/modify_my_profile_controller/modify_my_profile_controller.dart';
import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifyMyProfileUserAvatar extends ConsumerWidget {
  const ModifyMyProfileUserAvatar({super.key});

  double get radius => 60;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarInput = ref.watch(
      modifyMyProfileControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.avatarInput,
      ),
    );

    final isLoading = ref.watch(
      modifyMyProfileControllerProvider.select((state) => state.isLoading),
    );

    return EICircleAvatar(
      userAvatar: avatarInput != null && avatarInput.value != null
          ? UserAvatar.network(avatarInput.value!)
          : null,
      editable: !isLoading,
      radius: radius,
      onPickingImageFinish: (userAvatar) {
        ref
            .read(modifyMyProfileControllerProvider.notifier)
            .updateAvatarInput(userAvatar?.path);
      },
    );
  }
}
