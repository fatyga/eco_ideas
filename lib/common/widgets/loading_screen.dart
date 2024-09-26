import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  static const String path = '/loading';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.6),
        body: const Center(child: CircularProgressIndicator()));
  }
}
