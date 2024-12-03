import 'package:flutter/material.dart';

class IdeaImage extends StatelessWidget {
  const IdeaImage({required this.imageUrl, this.width, this.height, super.key});

  final String? imageUrl;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
      ),
      width: width,
      height: height,
      child: imageUrl == null
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline),
                Text('Image was not added'),
              ],
            )
          : Image.network(
              imageUrl!,
              errorBuilder: (context, error, stackTrace) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning_amber, color: theme.colorScheme.error),
                  Text(
                    'Failed to load an image',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.colorScheme.error),
                  ),
                ],
              ),
            ),
    );
  }
}
