import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/home/presentation/controller/home_controller.dart';
import 'package:eco_ideas/features/home/presentation/widgets/home_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const path = '/home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(homeControllerProvider).index;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ElevatedButton(
        onPressed: () => ref.read(authRepositoryProvider).signOut(),
        child: const Text('Logout'),
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: ref.read(homeControllerProvider.notifier).change,
      ),
    );
  }
}
