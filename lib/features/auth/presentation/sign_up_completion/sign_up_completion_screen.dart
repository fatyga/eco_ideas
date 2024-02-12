import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpCompletionScreen extends StatelessWidget {
  const SignUpCompletionScreen({super.key});
  static const String path = 'signUpCompletion';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          const Icon(Icons.check, size: 48),
          Text(
            l10n.signUpFinishedTitle,
            style: theme.textTheme.headlineSmall!
                .copyWith(color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Text(l10n.signUpFinishedDescription),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go(const HomeRoute().location),
            child: Text(l10n.signUpFinishedButtonText),
          ),
        ],
      ),
    );
  }
}
