import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class DeleteAvatarButton extends StatelessWidget {
  const DeleteAvatarButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListTile(
      onTap: onPressed,
      leading: const Icon(Icons.delete),
      title: Text(l10n.avatarDialogDeleteAvatarButtonLabelText),
    );
  }
}
