import 'package:eco_ideas/features/user/user.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileValue = ref.watch(currentUserProfileProvider);

    return Scaffold(
      appBar: AppBar(),
      body: userProfileValue.when(
        data: (userProfile) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: userProfile.avatarUrl == null
                      ? null
                      : Image.network(
                          userProfile.avatarUrl!,
                          frameBuilder: (context, _, __, ___) =>
                              const Center(child: CircularProgressIndicator()),
                          errorBuilder: (error, _, __) =>
                              const Icon(Icons.person),
                        ).image,
                  radius: 60,
                  child: userProfile.avatarUrl == null
                      ? const Icon(Icons.portrait, size: 48)
                      : null,
                ),
                Text(userProfile.username),
                Text(userProfile.fullName ?? ''),
                Text(userProfile.bio ?? ''),
              ],
            ),
          );
        },
        error: (error, _) =>
            const Center(child: Text('Failed to load profile')),
        // TODO(fatyga): change the way how loading state is represented
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: userProfileValue.isLoading
          ? null
          : FloatingActionButton(
              onPressed: () => context.go('/userProfile/editor'),
              child: const Icon(Icons.edit),
            ),
    );
  }
}
