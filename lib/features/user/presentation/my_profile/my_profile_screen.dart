import 'package:eco_ideas/features/user/presentation/my_profile/my_profile.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/widgets/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});
  static const path = 'myProfile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProfile = ref.watch(myProfileControllerProvider);

    return myProfile.when(
      data: (profile) => Scaffold(
        body: ListView(
          children: const [
            Center(child: MyProfileUserAvatar()),
            MyProfileSignOutButton(),
          ],
        ),
      ),
      error: (error, stackTrace) => Column(
        children: [
          const Center(child: Text('Fail to load your profile')),
          ElevatedButton(
            onPressed: ref.read(myProfileControllerProvider.notifier).retry,
            child: const Text('Retry'),
          ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
