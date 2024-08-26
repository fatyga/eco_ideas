import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';

import 'package:eco_ideas/features/ideas/presentation/idea_editor/controller/idea_editor_controller.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_step_form.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/step_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaEditorScreen extends ConsumerWidget {
  const IdeaEditorScreen({required this.idea, super.key});

  final EcoIdea? idea;
  static const String routePath = 'ideaCreator';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ideaEditorControllerProvider(idea));
    return Scaffold(
      bottomSheet:
          StepIndicator(type: state.idea.steps[state.currentStep].type),
      body: IdeaStepForm(),
    );
  }
}
