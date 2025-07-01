part of 'idea_card.dart';

class _IdeaCardDetails extends StatelessWidget {
  const _IdeaCardDetails({required this.idea});

  final Idea idea;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            idea.title ?? '',
            style: theme.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w300),
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ),
        Text(
          '${idea.steps.length} steps',
          style: theme.textTheme.bodySmall,
        ),
        Text('by ${idea.userId.substring(0,5)}'),
      ],
    );
  }
}
