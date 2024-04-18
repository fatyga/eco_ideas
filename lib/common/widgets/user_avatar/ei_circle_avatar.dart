import 'dart:io';

import 'package:eco_ideas/common/widgets/user_avatar/avatar_dialog/avatar_dialog.dart';
import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar.dart';
import 'package:flutter/material.dart';

class EICircleAvatar extends StatelessWidget {
  const EICircleAvatar({
    this.userAvatar,
    this.radius = 20,
    this.editable = false,
    this.onPickingImageFinish,
    super.key,
  });

  final UserAvatar? userAvatar;

  final double radius;

  final void Function(UserAvatar? userAvatar)? onPickingImageFinish;
  final bool editable;

  Future<UserAvatar?> _showAvatarDialog(
    BuildContext context,
    UserAvatar? userAvatar,
  ) async {
    return showDialog<UserAvatar?>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AvatarDialog(
        userAvatar: userAvatar,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar = CircleAvatar(
      foregroundImage: userAvatar != null
          ? switch (userAvatar!.source) {
              UserAvatarSource.local =>
                Image.file(File(userAvatar!.path), fit: BoxFit.cover).image,
              UserAvatarSource.network =>
                Image.network(userAvatar!.path, fit: BoxFit.cover).image
            }
          : null,
      radius: radius,
      child: userAvatar == null ? Icon(Icons.person, size: radius / 1.1) : null,
    );

    if (editable) {
      return GestureDetector(
        onTap: () async {
          if (onPickingImageFinish != null) {
            final image = await _showAvatarDialog(context, userAvatar);

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
