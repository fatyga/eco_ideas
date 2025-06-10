import 'package:eco_ideas/utils/blink_animation.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    required this.isSaving,
    required this.onPressed,
    super.key,
  });

  final bool isSaving;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isSaving) {
          return BlinkAnimation(
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.save),
            ),
          );
        } else {
          return IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.save),
          );
        }
      },
    );
  }
}
