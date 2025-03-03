import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final userProfileValue = ref.watch(currentUserProfileProvider);

    return Scaffold(
      appBar: AppBar(),
      body: userProfileValue.when(
        data: (userProfile) {
          return Padding(
            padding: context.paddings.allLarge,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CircleAvatar(
                    foregroundImage: userProfile.avatarUrl == null
                        ? null
                        : Image.network(
                            userProfile.avatarUrl!,
                            frameBuilder: (context, _, __, ___) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorBuilder: (error, _, __) =>
                                const Icon(Icons.person),
                          ).image,
                    radius: 60,
                    child: userProfile.avatarUrl == null
                        ? const Icon(Icons.portrait, size: 48)
                        : null,
                  ),
                ),
                context.spaces.verticalLarge,
                Text(
                  userProfile.fullName ?? '',
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  '@${userProfile.username}',
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.colorScheme.primary),
                ),
                context.spaces.verticalLarge,
                Text(userProfile.bio ?? '', style: theme.textTheme.bodySmall)
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
              heroTag: 'user_profile_fab',
              onPressed: () => context.go('/userProfile/editor'),
              child: const Icon(Icons.edit),
            ),
    );
  }
}
