import 'package:eco_ideas/common/widgets/user_avatar.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarDialog extends StatefulWidget {
  const AvatarDialog({this.imagePath, super.key});

  final String? imagePath;

  @override
  State<AvatarDialog> createState() => _AvatarDialogState();
}

class _AvatarDialogState extends State<AvatarDialog> {
  bool get isAvatarPresent => imagePath != null;
  bool get areChangesToSave => widget.imagePath != imagePath;
  late String? imagePath;

  @override
  void initState() {
    imagePath = widget.imagePath;
    super.initState();
  }

  void _deleteAvatar() {
    setState(() {
      imagePath = null;
    });
  }

  void _setImagePath(String? path) {
    if (path == null) return;
    setState(() {
      imagePath = path;
    });
  }

  void _saveChanges() {
    if (areChangesToSave) {
      Navigator.pop(context, imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UserAvatar(
              radius: 60,
              imagePath: imagePath,
            ),
            const SizedBox(height: 16),
            if (!isAvatarPresent)
              _AddAvatarButton(
                onPressed: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  _setImagePath(image?.path);
                },
              ),
            if (isAvatarPresent) ...[
              _ChangeAvatarButton(
                onPressed: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  _setImagePath(image?.path);
                },
              ),
              _DeleteAvatarButton(
                onPressed: _deleteAvatar,
              )
            ],
            if (areChangesToSave)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: _SaveButton(onTap: _saveChanges),
              ),
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

class _SaveButton extends StatelessWidget {
  const _SaveButton({required this.onTap, super.key});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      child: const Text('Save changes'),
    );
  }
}
