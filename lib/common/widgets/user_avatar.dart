import 'dart:io';

import 'package:eco_ideas/common/widgets/avatar_dialog/avatar_dialog.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    this.imagePath,
    this.radius = 20,
    this.editable = false,
    this.onPickingImageFinish,
    super.key,
  });

  final String? imagePath;
  final double radius;

  final void Function(String? image)? onPickingImageFinish;
  final bool editable;

  Future<String?> _showAvatarDialog(
    BuildContext context,
    String? imagePath,
  ) async {
    return showDialog<String?>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AvatarDialog(
        imagePath: imagePath,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar = CircleAvatar(
      foregroundImage: imagePath != null
          ? Image.file(
              File(imagePath!),
            ).image
          : null,
      radius: radius,
      child: imagePath == null ? Icon(Icons.person, size: radius / 1.1) : null,
    );

    if (editable) {
      return GestureDetector(
        onTap: () async {
          if (onPickingImageFinish != null) {
            final image = await _showAvatarDialog(context, imagePath);

            onPickingImageFinish!(image);
          }
        },
        child: Stack(
          children: [
            avatar,
            Positioned(
              right: radius / 6,
              bottom: radius / 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.edit, size: radius / 4),
              ),
            ),
          ],
        ),
      );
    }
    return avatar;
  }
}
