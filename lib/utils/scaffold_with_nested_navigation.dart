import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A form_fields pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            label: 'Explore',
            icon: Icon(
              navigationShell.currentIndex == 0
                  ? Icons.explore
                  : Icons.explore_outlined,
            ),
          ),
          NavigationDestination(
            label: 'My ideas',
            icon: Icon(
              navigationShell.currentIndex == 1
                  ? Icons.lightbulb
                  : Icons.lightbulb_outline,
            ),
          ),
          NavigationDestination(
              label: 'My profile',
              icon: Icon(navigationShell.currentIndex == 2
                  ? Icons.person
                  : Icons.person_outline,),),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
