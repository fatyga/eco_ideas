import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_step_form.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/step_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaEditorScreen extends ConsumerWidget {
  const IdeaEditorScreen({required this.ideaId, super.key});

  final String? ideaId;
  static const String routePath = 'ideaCreator';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomSheet: StepIndicator(type: EcoIdeaStepType.introduction),
      body: IdeaStepForm(),
    );
  }
}
