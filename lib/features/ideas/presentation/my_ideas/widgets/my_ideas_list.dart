import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_presenter/widgets/idea_image.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';

class MyIdeasList extends StatelessWidget {
  const MyIdeasList({required this.ideas, super.key});

  final List<EcoIdeaStep> ideas;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: ideas.map((idea) {
        return GestureDetector(
          onTap: () => IdeaIntroductorRoute(idea).go(context),
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IdeaImage(imageUrl: idea.imageUrl),
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
            ),
          ),
        );
      }).toList(),
    );
  }
}
