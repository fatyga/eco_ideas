import 'package:flutter/material.dart';

class IdeaImage extends StatelessWidget {
  const IdeaImage({required this.imageUrl, super.key});

  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 130,
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
