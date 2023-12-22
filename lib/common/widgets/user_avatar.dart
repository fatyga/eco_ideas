import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    this.image,
    this.radius = 20,
    this.onTap,
    this.editable = false,
    super.key,
  });

  final ImageProvider<Object>? image;
  final double radius;
  final VoidCallback? onTap;

  final bool editable;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar = GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: image,
        child: image == null ? Icon(Icons.person, size: radius / 1.1) : null,
      ),
    );

    if (editable) {
      return Stack(
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
      );
    }
    return avatar;
  }
}
