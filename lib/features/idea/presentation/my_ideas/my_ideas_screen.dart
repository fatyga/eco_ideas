import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyIdeasScreen extends StatelessWidget {
  const MyIdeasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('my ideas')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/ideaEditor');
          },
          child: const Icon(Icons.add)),
    );
  }
}
