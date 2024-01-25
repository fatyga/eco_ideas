import 'package:eco_ideas/common/widgets/labeled_action.dart';
import 'package:eco_ideas/l10n/l10n.dart';

import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordActionButton extends StatelessWidget {
  const ForgotPasswordActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return LabeledAction(
      label: Text(
        l10n.forgotPasswordButtonLabelText,
        style: theme.textTheme.labelMedium,
      ),
      actionText: Text(
        l10n.forgotPasswordButtonActionText,
        style: theme.textTheme.labelMedium!
            .copyWith(color: theme.colorScheme.primary),
      ),
      onActionTap: () => context.go(const PasswordResetRoute().location),
    );
  }
}
