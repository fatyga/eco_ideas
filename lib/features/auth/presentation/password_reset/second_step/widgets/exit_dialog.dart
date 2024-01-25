import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordResetSecondStepExitDialog extends StatelessWidget {
  const PasswordResetSecondStepExitDialog({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.passwordResetExitDialogTitleText),
      content: Text(l10n.passwordResetExitDescriptionText),
      actions: [
        TextButton(
          onPressed: () {
            context.pop<bool>(true);
          },
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () => context.pop<bool>(false),
          child: const Text('No'),
        ),
      ],
    );
  }
}
