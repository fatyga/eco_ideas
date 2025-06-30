part of 'idea_addon.dart';

class _IdeaAddonHeader extends StatelessWidget {
  const _IdeaAddonHeader({
    required this.addonType,
    required this.itemsCount,
    required this.onEditTap,
    required this.onVisibilityToggle,
    this.isContentVisible,
    super.key,
  });

  final IdeaAddonType addonType;
  final int itemsCount;
  final bool? isContentVisible;
  final VoidCallback onVisibilityToggle;
  final VoidCallback onEditTap;

  String get getItemsCountLabel {
    if (itemsCount == 0) {
      return '0 items';
    } else if (itemsCount == 1) {
      return '1 item';
    } else {
      return '$itemsCount items';
    }
  }

  bool get shouldItemsCountBeShown =>
      isContentVisible != null && !isContentVisible!;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: context.paddings.horizontalStandard,
      child: Row(
        children: [
          Icon(
            addonType.getIcon(),
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          context.spaces.horizontalStandard,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addonType.getTitle(context.l10n).toUpperCase(),
                style: GoogleFonts.spaceMono(
                  textStyle: theme.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (shouldItemsCountBeShown)
                Text(getItemsCountLabel,
                    style: theme.textTheme.labelMedium!
                        .copyWith(color: theme.hintColor)),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onEditTap,
            icon: const Icon(Icons.edit, size: 20),
          ),
          if (isContentVisible != null)
            IconButton(
              onPressed: onVisibilityToggle,
              icon: Icon(
                isContentVisible!
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
