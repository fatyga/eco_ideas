import 'package:eco_ideas/l10n/l10n.dart';
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
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            label: l10n.explore,
            icon: Icon(
              navigationShell.currentIndex == 0
                  ? Icons.explore
                  : Icons.explore_outlined,
            ),
          ),
          NavigationDestination(
            label: l10n.myIdeas,
            icon: Icon(
              navigationShell.currentIndex == 1
                  ? Icons.lightbulb
                  : Icons.lightbulb_outline,
            ),
          ),
          NavigationDestination(
            label: l10n.myProfile,
            icon: Icon(
              navigationShell.currentIndex == 2
                  ? Icons.person
                  : Icons.person_outline,
            ),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
