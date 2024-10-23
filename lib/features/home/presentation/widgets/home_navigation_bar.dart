import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final void Function(int) onDestinationSelected;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.map),
          label: l10n.homeExploreLabel,
        ),
        NavigationDestination(
          icon: const Icon(Icons.lightbulb_outline_rounded),
          label: l10n.homeMyIdeasLabel,
        ),
        NavigationDestination(
          icon: const Icon(Icons.person),
          label: l10n.homeProfileLabel,
        ),
      ],
    );
  }
}
