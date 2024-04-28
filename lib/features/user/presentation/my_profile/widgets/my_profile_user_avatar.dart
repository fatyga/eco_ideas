import 'package:eco_ideas/common/widgets/user_avatar/ei_circle_avatar.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/my_profile_controller/my_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileUserAvatar extends ConsumerWidget {
  const MyProfileUserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAvatar = ref.watch(myProfileControllerProvider
        .select((myProfileState) => myProfileState.valueOrNull?.userAvatar));
    return EICircleAvatar(
      userAvatar: userAvatar,
      radius: 64,
    );
  }
}
