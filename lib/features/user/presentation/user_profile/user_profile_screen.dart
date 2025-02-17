import 'package:eco_ideas/features/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(currentUserProfileProvider);

    return Scaffold(
      appBar: AppBar(),
      body: userProfile.when(
        data: (userProfile) {
          return Column(
            children: [
              Text(userProfile.username),
              Text(userProfile.fullName ?? ''),
              Text(userProfile.bio ?? ''),
            ],
          );
        },
        error: (error, _) =>
            const Center(child: Text('Failed to load profile')),
        // TODO(fatyga): change the way how loading state is represented
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: userProfile.isLoading
          ? null
          : FloatingActionButton(
              onPressed: () => context.go('/userProfile/editor'),
              child: const Icon(Icons.edit),
            ),
    );
  }
}
