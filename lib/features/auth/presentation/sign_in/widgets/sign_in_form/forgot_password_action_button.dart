import 'package:eco_ideas/common_widgets/labeled_action.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ForgotPasswordActionButton extends StatelessWidget {
  const ForgotPasswordActionButton({required this.onPressed, super.key});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return LabeledAction(
        label: Text(l10n.forgotPasswordButtonLabelText),
        actionText: Text(
          l10n.forgotPasswordButtonActionText,
          style: theme.textTheme.labelLarge!
              .copyWith(color: theme.colorScheme.primary),
        ),
        onActionTap: onPressed);
  }
}
