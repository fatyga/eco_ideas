import 'package:eco_ideas/l10n/l10n.dart';


import 'package:flutter/material.dart';

// TODO(fatyga): change name of this widget to more meaningful
// TODO(fatyga): set correct color of top border
class SignInScreenFooter extends StatelessWidget {
  const SignInScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: theme.textTheme.labelSmall,
              visualDensity: VisualDensity.compact,
            ),
            onPressed: () {},
            child: Text(l10n.signInScreenFooter_forgotPassword),
          ),
          FilledButton.tonal(
            style: FilledButton.styleFrom(
              textStyle: theme.textTheme.labelSmall,
              visualDensity: VisualDensity.compact,
            ),
            onPressed: () {},
            child: Text(
              l10n.signInScreenFooter_createAccount,
            ),
          ),
        ],
      ),
    );
  }
}
