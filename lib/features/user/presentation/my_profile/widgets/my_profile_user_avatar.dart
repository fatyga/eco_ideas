import 'package:eco_ideas/common/widgets/user_avatar/ei_circle_avatar.dart';
import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileUserAvatar extends ConsumerWidget {
  const MyProfileUserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAvatar = ref.watch(userAvatarControllerProvider).valueOrNull;
    return EICircleAvatar(
      userAvatar: userAvatar,
      radius: 64,
      editable: true,
    );
  }
}
