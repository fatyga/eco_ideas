import 'package:eco_ideas/common/widgets/user_avatar.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpAvatar extends ConsumerWidget {
  const SignUpAvatar({super.key});

  double get radius => 60;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarInput = ref.watch(
      signUpControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.avatarInput,
      ),
    );

    return UserAvatar(
      imagePath: avatarInput?.value ?? '',
      editable: true,
      radius: radius,
      onPickingImageFinish: (path) {
        ref.read(signUpControllerProvider.notifier).updateAvatar(path);
      },
    );
  }
}
