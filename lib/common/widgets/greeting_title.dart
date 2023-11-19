import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class GreetingTitle extends StatelessWidget {
  const GreetingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Text.rich(
      TextSpan(
        text: l10n.greetingText,
        style: theme.textTheme.headlineSmall,
        children: [
          TextSpan(
            text: l10n.appName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
