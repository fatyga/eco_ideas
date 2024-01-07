import 'package:eco_ideas/common/widgets/labeled_action.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/router/go_router_provider/go_router_provider.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordActionButton extends ConsumerWidget {
  const ForgotPasswordActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onActionTap: () =>
          ref.read(goRouterProvider).go(const PasswordResetRoute().location),
    );
  }
}
