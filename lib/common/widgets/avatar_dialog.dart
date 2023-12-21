import 'package:eco_ideas/common/widgets/user_avatar.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AvatarDialog extends StatelessWidget {
  const AvatarDialog({this.imagePath, super.key});

  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const UserAvatar(radius: 40),
            const SizedBox(height: 16),
            if (imagePath == null)
              _AddAvatarButton(
                onPressed: () {},
              ),
            if (imagePath?.isNotEmpty != null) ...[
              _ChangeAvatarButton(
                onPressed: () {},
              ),
              _DeleteAvatarButton(onPressed: () {}),
            ],
          ],
        ),
      ),
    );
  }
}

class _DeleteAvatarButton extends StatelessWidget {
  const _DeleteAvatarButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListTile(
      onTap: onPressed,
      leading: const Icon(Icons.delete),
      title: Text(l10n.signUpDeleteAvatarButtonLabelText),
    );
  }
}

class _ChangeAvatarButton extends StatelessWidget {
  const _ChangeAvatarButton({
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListTile(
      onTap: onPressed,
      leading: const Icon(Icons.edit),
      title: Text(l10n.signUpChangeAvatarButtonLabelText),
    );
  }
}

class _AddAvatarButton extends StatelessWidget {
  const _AddAvatarButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListTile(
      onTap: onPressed,
      leading: const Icon(Icons.add),
      title: Text(l10n.signUpAddAvatarButtonLabelText),
    );
  }
}
