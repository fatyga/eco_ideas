import 'package:eco_ideas/common/widgets/user_avatar/ei_circle_avatar.dart';
import 'package:eco_ideas/common/widgets/user_avatar/user_avatar.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileUserAvatar extends ConsumerWidget {
  const MyProfileUserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarUrl = ref.watch(myProfileControllerProvider
        .select((state) => state.valueOrNull?.avatarUrl));
    return EICircleAvatar(
      userAvatar: avatarUrl != null ? UserAvatar.network(avatarUrl) : null,
      radius: 64,
    );
  }
}
