import 'package:eco_ideas/features/explore/presentation/explore/explore_screen.dart';

import 'package:eco_ideas/features/home/presentation/widgets/home_navigation_bar.dart';

import 'package:eco_ideas/features/ideas/presentation/my_ideas/my_ideas_screen.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/my_profile_screen.dart';

import 'package:eco_ideas/router/routes/routes.dart';

import 'package:flutter/material.dart';

enum HomeDestination { explore, myIdeas, profile }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const path = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeDestination currentDestination = HomeDestination.explore;

  void selectDestination(int index) {
    setState(() {
      currentDestination = HomeDestination.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (currentDestination) {
        HomeDestination.explore => const ExploreScreen(),
        HomeDestination.myIdeas => const MyIdeasScreen(),
        HomeDestination.profile => const MyProfileScreen(),
      },
      floatingActionButton: switch (currentDestination) {
        HomeDestination.explore => null,
        HomeDestination.myIdeas => FloatingActionButton(
            onPressed: () async => const IdeaEditorRoute(null).go(context),
            child: const Icon(Icons.add),
          ),
        HomeDestination.profile => null,
      },
      bottomNavigationBar: HomeNavigationBar(
        selectedIndex: currentDestination.index,
        onDestinationSelected: selectDestination,
      ),
    );
  }
}
