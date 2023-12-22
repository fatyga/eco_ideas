import 'package:eco_ideas/common/widgets/avatar_dialog.dart';
import 'package:eco_ideas/common/widgets/user_avatar.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:image_picker/image_picker.dart';

class SignUpUserAvatar extends ConsumerWidget {
  const SignUpUserAvatar({super.key});

  Future<void> _showAvatarDialog(
    BuildContext context,
    String? imagePath,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (context) => AvatarDialog(
        imagePath: imagePath,
      ),
    );
  }

  double get radius => 60;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final imagePath = ref.watch(
      signUpControllerProvider
          .select((controllerState) => controllerState.valueOrNull?.avatarUrl),
    );

    return UserAvatar(
      editable: true,
      radius: radius,
      onTap: () => _showAvatarDialog(context, imagePath),
    );
  }
}
