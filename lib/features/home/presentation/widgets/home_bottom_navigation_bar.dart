import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.map),
          label: l10n.homeExploreLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.lightbulb_outline_rounded),
          label: l10n.homeMyIdeasLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: l10n.homeProfileLabel,
        ),
      ],
    );
  }
}
