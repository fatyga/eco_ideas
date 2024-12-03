import 'package:eco_ideas/common/widgets/idea_card.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';

class EcoIdeasList extends StatelessWidget {
  const EcoIdeasList({required this.ideas, required this.compact, super.key});

  final List<EcoIdeaStep> ideas;
  final bool compact;
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
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IdeaCard(idea: idea, compact: compact),
          ),
        );
      }).toList(),
    );
  }
}
