import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ConfirmEmail extends StatelessWidget {
  const ConfirmEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        const Icon(Icons.mark_email_read_sharp, size: 48),
        const SizedBox(height: 8),
        Text(
          l10n.signUpConfirmEmailAppBarTitleText,
          style: theme.textTheme.headlineSmall!
              .copyWith(color: theme.colorScheme.primary),
        ),
        const SizedBox(height: 16),
        Text(l10n.passwordResetLinkSentDescription),
      ],
    );
  }
}
