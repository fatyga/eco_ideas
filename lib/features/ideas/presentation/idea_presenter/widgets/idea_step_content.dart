import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_presenter/widgets/idea_image.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_presenter/widgets/idea_step_addon_section.dart';
import 'package:flutter/material.dart';

class IdeaStepContent extends StatelessWidget {
  const IdeaStepContent({required this.step, super.key});

  final EcoIdeaStep step;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          IdeaImage(imageUrl: step.imageUrl),
          const SizedBox(height: 16),
          Text(
            step.title,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(step.description),
          const SizedBox(height: 32),
          ...step.availableAddonTypes.map((addonType) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: IdeaPresenterAddonSection(
                addon: addonType,
                values: step.addons
                    .where((addon) => addon.type == addonType)
                    .toList(),
              ),
            );
          }),
        ]);
  }
}
