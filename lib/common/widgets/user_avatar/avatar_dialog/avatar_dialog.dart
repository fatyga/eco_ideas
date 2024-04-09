import 'package:eco_ideas/common/widgets/user_avatar/avatar_dialog/delete_button.dart';
import 'package:eco_ideas/common/widgets/user_avatar/avatar_dialog/exit_button.dart';
import 'package:eco_ideas/common/widgets/user_avatar/avatar_dialog/save_button.dart';
import 'package:eco_ideas/common/widgets/user_avatar/avatar_dialog/upload_expansion_tile.dart';
import 'package:eco_ideas/common/widgets/user_avatar/user_avatar.dart';
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
  late final ImagePicker _imagePicker;
  bool get isAvatarPresent => imagePath != null;
  bool get imageChanged => widget.imagePath != imagePath;
  late String? imagePath;

  @override
  void initState() {
    _imagePicker = ImagePicker();
    imagePath = widget.imagePath;
    super.initState();
  }

  void _deleteAvatar() {
    setState(() {
      imagePath = null;
    });
  }

  Future<void> _pickImage(ImageSource imageSource) async {
    final image = await _imagePicker.pickImage(source: imageSource);

    if (image == null) return;
    setState(() {
      imagePath = image.path;
    });
  }

  void _exit() => Navigator.pop(context, widget.imagePath);
  void _exitWithChange() => Navigator.pop(context, imagePath);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Dialog(
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: ExitButton(
              onPressed: _exit,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserAvatar(
                  radius: 60,
                  imagePath: imagePath,
                ),
                const SizedBox(height: 16),
                if (!isAvatarPresent)
                  AvatarUploadExpansionTile(
                    icon: const Icon(Icons.add),
                    title: l10n.avatarDialogAddAvatarButtonLabelText,
                    onPressed: _pickImage,
                  ),
                if (isAvatarPresent) ...[
                  AvatarUploadExpansionTile(
                    icon: const Icon(Icons.edit),
                    title: l10n.avatarDialogChangeAvatarButtonLabelText,
                    onPressed: _pickImage,
                  ),
                  DeleteAvatarButton(
                    onPressed: _deleteAvatar,
                  ),
                ],
                if (imageChanged)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SaveButton(onTap: _exitWithChange),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
