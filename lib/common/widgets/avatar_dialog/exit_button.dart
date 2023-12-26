import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({required this.onPressed, super.key});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return IconButton(
      tooltip: l10n.avatarDialogCloseButtonTooltipText,
      icon: const Icon(Icons.close),
      onPressed: onPressed,
    );
  }
}
