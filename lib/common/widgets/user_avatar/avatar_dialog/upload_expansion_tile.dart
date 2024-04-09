import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarUploadExpansionTile extends StatelessWidget {
  const AvatarUploadExpansionTile({
    required this.title,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String title;
  final Icon icon;
  final Future<void> Function(ImageSource source) onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ExpansionTile(
      leading: icon,
      title: Text(title),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.image),
                        onPressed: () async {
                          ExpansionTileController.of(context).collapse();
                          await onPressed(ImageSource.gallery);
                        },
                      );
                    },
                  ),
                  Text(l10n.avatarDialogPickGalleryOptionLabelText),
                ],
              ),
              Column(
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.camera),
                        onPressed: () async {
                          ExpansionTileController.of(context).collapse();
                          await onPressed(ImageSource.camera);
                        },
                      );
                    },
                  ),
                  Text(l10n.avatarDialogCameraOptionLabelText),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
