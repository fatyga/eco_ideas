import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';

import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_step_form.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/step_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaEditorScreen extends ConsumerStatefulWidget {
  const IdeaEditorScreen({required this.idea, super.key});

  // If null, it means that user wants to create new idea
  final EcoIdea? idea;
  static const String routePath = 'ideaEditor';

  @override
  ConsumerState<IdeaEditorScreen> createState() => _IdeaEditorScreenState();
}

class _IdeaEditorScreenState extends ConsumerState<IdeaEditorScreen> {
  late AsyncValue<EcoIdea> idea;
  int stepIndex = 0;

  @override
  void initState() {
    if (widget.idea == null) {
      final profileId = ref.read(userProfileChangesProvider).requireValue.id;
      idea = AsyncValue.data(EcoIdea.draft(profileId: profileId));
    } else {
      idea = AsyncValue.data(widget.idea!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final ideaValue = idea.requireValue;
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: StepIndicator(
        onPreviousStepTap: stepIndex == 0
            ? null
            : () {
                setState(() {
                  stepIndex--;
                });
              },
        onNextStepTap: stepIndex < ideaValue.steps.length
            ? () {
                setState(() {
                  stepIndex++;
                });
              }
            : () {
                setState(() {
                  ideaValue.steps
                      .add(EcoIdeaStep.empty(stepIndex++, ideaValue.id));
                });
              },
        index: stepIndex,
      ),
      body: IdeaStepForm(step: ideaValue.steps[stepIndex]),
    );
  }
}
