import 'package:eco_ideas/common/widgets/user_avatar.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SignUpUserAvatar extends ConsumerWidget {
  const SignUpUserAvatar({super.key});

  Future<void> _showAvatarSourceDialog(BuildContext context) async {
    final l10n = context.l10n;
    await showDialog<ImageSource>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(l10n.signUpPickAvatarDialogTitle),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                await _pickAvatar(ImageSource.gallery);
              },
              child: ListTile(
                leading: const Icon(Icons.image),
                title: Text(
                  l10n.signUpPickAvatarDialogGalleryOptionTitle,
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                await _pickAvatar(ImageSource.camera);
              },
              child: ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(l10n.signUpPickAvatarDialogCameraOptionTitle),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickAvatar(ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(
      signUpControllerProvider
          .select((controllerState) => controllerState.valueOrNull?.avatarUrl),
    );

    return Column(
      children: <Widget>[
        const UserAvatar(radius: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath == null || imagePath.isEmpty)
              _AddAvatarButton(
                onPressed: () => _showAvatarSourceDialog(context),
              ),
            if (imagePath != null && imagePath.isNotEmpty) ...[
              _ChangeAvatarButton(
                onPressed: () {},
              ),
              _DeleteAvatarButton(onPressed: () {}),
            ],
          ],
        ),
      ],
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
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.delete),
      label: Text(l10n.signUpDeleteAvatarButtonLabelText),
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
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.edit),
      label: Text(l10n.signUpChangeAvatarButtonLabelText),
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
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      label: Text(l10n.signUpAddAvatarButtonLabelText),
    );
  }
}
