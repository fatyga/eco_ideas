import 'package:flutter/material.dart';

class MyIdeasScreen extends StatelessWidget {
  const MyIdeasScreen({super.key});

  static const path = 'myIdeas';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Center(
        child: Text('My Ideas'),
      ),
    );
  }
}
