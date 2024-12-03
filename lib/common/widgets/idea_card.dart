import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_presenter/widgets/idea_image.dart';
import 'package:flutter/material.dart';

class IdeaCard extends StatelessWidget {
  const IdeaCard({required this.idea, this.compact = false, super.key});

  final EcoIdeaStep idea;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (compact) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            IdeaImage(imageUrl: idea.imageUrl, width: 80),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Text(
                    idea.title,
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        IdeaImage(imageUrl: idea.imageUrl, height: 130),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                idea.title,
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
