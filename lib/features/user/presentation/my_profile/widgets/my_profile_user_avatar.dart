import 'package:eco_ideas/common/widgets/user_avatar/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileUserAvatar extends ConsumerWidget {
  const MyProfileUserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const UserAvatar(editable: true);
  }
}
