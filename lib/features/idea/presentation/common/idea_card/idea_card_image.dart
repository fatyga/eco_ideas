part of 'idea_card.dart';

class _IdeaCardImage extends StatelessWidget {
  const _IdeaCardImage({
    required this.ideaCardLayout,
    this.imageUrl,
  });

  final String? imageUrl;
  final IdeaCardLayout ideaCardLayout;

  double? get width => ideaCardLayout == IdeaCardLayout.horizontal ? 100 : null;

  double? get height => ideaCardLayout == IdeaCardLayout.horizontal ? 100 : 200;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: Builder(
        builder: (context) {
          if (imageUrl == null) {
            return ColoredBox(
              color: theme.colorScheme.surfaceContainerLow,
              child:
                  const Center(child: Icon(Icons.image_not_supported_outlined)),
            );
          } else {
            return Image.network(
              imageUrl!,
              errorBuilder: (context, error, stackTrace) => Container(
                color: theme.colorScheme.errorContainer.withAlpha(200),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline, color: theme.colorScheme.error),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
