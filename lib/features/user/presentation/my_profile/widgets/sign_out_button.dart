import 'package:eco_ideas/features/user/presentation/my_profile/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileSignOutButton extends ConsumerWidget {
  const MyProfileSignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: ref.read(myProfileControllerProvider.notifier).signOut,
      icon: const Icon(Icons.logout),
    );
  }
}
