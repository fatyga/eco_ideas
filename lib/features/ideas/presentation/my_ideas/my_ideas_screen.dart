import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyIdeasScreen extends StatelessWidget {
  const MyIdeasScreen({super.key});

  static const path = 'myIdeas';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('My Ideas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          const IdeaCreatorRoute().location,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
