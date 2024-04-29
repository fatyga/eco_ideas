import 'package:eco_ideas/features/user/presentation/my_profile/my_profile.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/widgets/my_profile_details/my_profile_details.dart';
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
        appBar: AppBar(
          actions: const [
            MyProfileSignOutButton(),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          children: [
            const Center(child: MyProfileUserAvatar()),
            MyProfileDetails(profile.userProfile),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.edit),
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
