import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({this.image, this.radius = 20, this.onTap, super.key});

  final ImageProvider<Object>? image;
  final double radius;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: image,
        child: image == null ? Icon(Icons.person, size: radius / 1.1) : null,
      ),
    );
  }
}
