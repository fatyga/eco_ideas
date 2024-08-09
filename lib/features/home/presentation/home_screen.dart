import 'package:eco_ideas/features/explore/presentation/explore/explore_screen.dart';
import 'package:eco_ideas/features/home/presentation/controller/home_controller.dart';
import 'package:eco_ideas/features/home/presentation/controller/home_state.dart';
import 'package:eco_ideas/features/home/presentation/widgets/home_bottom_navigation_bar.dart';
import 'package:eco_ideas/features/ideas/presentation/my_ideas/my_ideas_screen.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/my_profile_screen.dart';
import 'package:eco_ideas/router/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const path = '/home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScreen = ref.watch(homeControllerProvider);
    return Scaffold(
      body: switch (currentScreen) {
        HomeState.explore => const ExploreScreen(),
        HomeState.myIdeas => const MyIdeasScreen(),
        HomeState.profile => const MyProfileScreen(),
      },
      floatingActionButton: switch (currentScreen) {
        HomeState.explore => null,
        HomeState.myIdeas => FloatingActionButton(
            onPressed: () => const IdeaEditorRoute().go(context),
            child: const Icon(Icons.add),
          ),
        HomeState.profile => null,
      },
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: currentScreen.index,
        onTap: ref.read(homeControllerProvider.notifier).change,
      ),
    );
  }
}
