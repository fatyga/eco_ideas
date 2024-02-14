import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const path = '/home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ElevatedButton(
        onPressed: () => context.go(
            '/home/signUpCompletion'), //() => ref.read(authRepositoryProvider).signOut(),
        child: const Text('Logout'),
      ),
    );
  }
}
