import 'package:eco_ideas/common/widgets/user_avatar/ei_circle_avatar.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/sign_up_completion_controller/sign_up_completion_controller.dart';
import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpCompletionUserAvatar extends ConsumerWidget {
  const SignUpCompletionUserAvatar({super.key});

  double get radius => 60;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarInput = ref.watch(
      signUpCompletionControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.avatarInput,
      ),
    );

    final isLoading = ref.watch(
      signUpCompletionControllerProvider.select((state) => state.isLoading),
    );

    return EICircleAvatar(
      userAvatar: avatarInput != null && avatarInput.value != null
          ? UserAvatar.local(avatarInput.value!)
          : null,
      editable: !isLoading,
      radius: radius,
      onPickingImageFinish: (userAvatar) {
        ref
            .read(signUpCompletionControllerProvider.notifier)
            .updateAvatarInput(userAvatar?.path);
      },
    );
  }
}
