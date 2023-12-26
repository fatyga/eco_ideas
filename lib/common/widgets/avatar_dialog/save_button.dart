import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FilledButton(
      onPressed: onTap,
      child: Text(l10n.avatarDialogSaveButtonText),
    );
  }
}
