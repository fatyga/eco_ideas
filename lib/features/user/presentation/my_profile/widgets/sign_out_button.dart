import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileSignOutButton extends ConsumerWidget {
  const MyProfileSignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref
        .watch(myProfileControllerProvider.select((state) => state.isLoading));

    return PrimaryButton(
      isLoading: isLoading,
      onPressed: ref.read(myProfileControllerProvider.notifier).signOut,
      child: const Text('Sign out'),
    );
  }
}
