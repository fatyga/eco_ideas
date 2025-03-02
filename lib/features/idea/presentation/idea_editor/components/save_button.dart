import 'package:eco_ideas/utils/spaces.dart';
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
    final theme = Theme.of(context);
    return IconButton(
      onPressed: onPressed,
      icon: Stack(
        children: [
          if (isSaving)
            Container(
              color: theme.scaffoldBackgroundColor,
              padding: context.paddings.allSmall,
              child: const Positioned(
                right: 0,
                bottom: 0,
                child: const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(strokeWidth: 1),
                ),
              ),
            ),
          const Icon(Icons.save),
        ],
      ),
    );
  }
}
